# High-Performance Scala Notes

Some overall notes on JVM performance optimization techniques:

* [JVM Optimization Techniques](https://advancedweb.hu/2016/05/27/jvm_jit_optimization_techniques/)
* [Hybrid JVM Perf Profiling](http://blogs.microsoft.co.il/sasha/2017/07/07/profiling-the-jvm-on-linux-a-hybrid-approach/) - using AGTC and perf on Linux

## Avoiding Exceptions

Throwing exceptions is way too common, especially in Java and Java-ish Scala code.  The problem is that unless it is truly exceptional, exceptions are VERY expensive, in terms of both heap and runtime cost.  

For example, our `BinaryVector` classes originally could throw if trying to add an element beyond the available space for a vector.  The problem is that this is not really exceptional.  Exceeding space is a fairly common use case.  

Redesigning APIs to return proper values is not only more performant, but more functional and easier to test as well.

## Beware of vars

Of course as Scala programmers you learn that vars are evil, except sometimes for performance reasons you really need them.  However, beware that the default implementation for a class instance var adds a check for both reads and writes to make sure that the var is initialized already, otherwise the bytecode throws an `UninitializedException`.  For vars that you are counting on to change quickly, this means vars might not get inlined and might be very slow.  To skip this logic, put your vars inside the class constructors as `private var`s instead.  This guarantees that they are initialized, causes scalac to skip the initialization check (Scala 2.11), and gives you a 2x to 5x performance boost!

Another idea worth considering:  use unsafe.getAndAddInt() when adding.  Much cheaper (one instruction) than the default bytecode.

## Specialization and Boxing

### How scalac conmpiles traits

### Specialized Traits and Classes

### How to Know When Boxing Occurs

### Primitives, boxing, and type safety

The most efficient interface is to directly work with each primitive type of course, which guarantees minimal bytecode.  To make the code a little more readable, we can type alias the primitive into something more readable:

```scala
scala> type BinPtr = Long
defined type alias BinPtr

scala> class Bar
defined class Bar

scala> class Bar {
     |   def getWireFormat(p: BinPtr): BinPtr = p + 4
     | }
defined class Bar

scala> :javap Bar
...
{
  public long getWireFormat(long);
    descriptor: (J)J
    flags: ACC_PUBLIC
    Code:
      stack=4, locals=3, args_size=2
         0: lload_1
         1: ldc2_w        #8                  // long 4l
         4: ladd
         5: lreturn
```

Long argument, Long return result, minimal bytecode.

The problem though is that a type alias does not make our new type unique.  For example in the code above, any Long can be passed in as a BinPtr.  How can we have a little more protection?

```scala
scala> trait Pointer
defined trait Pointer

scala> trait WordLengthRegion
defined trait WordLengthRegion

scala> type BinaryVectPtr = Long with Pointer with WordLengthRegion
defined type alias BinaryVectPtr

scala> class Foo {
     |   def getWireFormat(p: BinaryVectPtr): BinaryVectPtr = (p + 4).asInstanceOf[BinaryVectPtr]
     | }
defined class Foo

scala> :javap Foo
...
{
  public long getWireFormat(long);
    descriptor: (J)J
    flags: ACC_PUBLIC
    Code:
      stack=4, locals=3, args_size=2
         0: lload_1
         1: ldc2_w        #8                  // long 4l
         4: ladd
         5: invokestatic  #15                 // Method scala/runtime/BoxesRunTime.boxToLong:(J)Ljava/lang/Long;
         8: invokestatic  #19                 // Method scala/runtime/BoxesRunTime.unboxToLong:(Ljava/lang/Object;)J
        11: lreturn
```

This is nearly as good, still a primitive return value and argument, but there are two extra mysterious back to back `invokestatic`s which call boxing and unboxing, which seem unnecessary and may be optimized out in the final bytecode/assembly after JIT.

You can test it yourself but the above definition prevents regular Longs from being passed in as a `BinaryVectPtr`.  The disadvantage is that we need casts in the code to make it work.  Those can be hidden behind some apply magic I guess.  Also, the above definition can be put into arrays and result in a 

Another possible solution is to use [scala-newtype](https://github.com/estatico/scala-newtype).  There is a `@newsubtype` macro which can wrap primitives with no runtime cost around a new "type".  For this raw code:

```scala
object Test {
  @newsubtype case class VectorPointer(addr: Long)

  class Foo {
    def add4(p1: VectorPointer): VectorPointer = VectorPointer(p1.addr + 4)
  }
}
```

This produces this bytecode:

```
  public long add4(long);
    descriptor: (J)J
    flags: ACC_PUBLIC
    Code:
      stack=5, locals=3, args_size=2
         0: getstatic     #13                 // Field filodb/akkabootstrapper/Test$VectorPointer$.MODULE$:Lfilodb/akkabootstrapper/Test$VectorPointer$;
         3: getstatic     #18                 // Field filodb/akkabootstrapper/Test$VectorPointer$Ops$newtype$.MODULE$:Lfilodb/akkabootstrapper/Test$VectorPointer$Ops$newtype$;
         6: getstatic     #13                 // Field filodb/akkabootstrapper/Test$VectorPointer$.MODULE$:Lfilodb/akkabootstrapper/Test$VectorPointer$;
         9: lload_1
        10: invokevirtual #21                 // Method filodb/akkabootstrapper/Test$VectorPointer$.Ops$newtype:(J)J
        13: invokevirtual #24                 // Method filodb/akkabootstrapper/Test$VectorPointer$Ops$newtype$.addr$extension:(J)J
        16: ldc2_w        #25                 // long 4l
        19: ladd
        20: invokevirtual #29                 // Method filodb/akkabootstrapper/Test$VectorPointer$.apply:(J)J
        23: lreturn
```

The bytecode looks ugly, but you still have primitive arguments and return values, and I think most of the bytecode above can be JITted out, but will have to verify that.

#### A performance comparison test

Adding some testing code and changing the adder used to each type, we get the following results:

```scala
object Test {
  @newsubtype case class VectorPointer(addr: Long)

  class VectorPointerAdder {
    def add4(p1: VectorPointer): VectorPointer = VectorPointer(p1.addr + 4)
  }

  trait Pointer
  trait BinVector
  type VectorPtrWith = Long with BinVector with Pointer

  object VectorPtrWith {
    def apply(l: Long): VectorPtrWith = l.asInstanceOf[VectorPtrWith]
  }

  class VectorPtrWithAdder {
    def add4(p1: VectorPtrWith): VectorPtrWith = VectorPtrWith(p1 + 4)
  }

  type VectorPtrLong = Long

  class VectorPtrLongAdder {
    def add4(p1: VectorPtrLong): VectorPtrLong = p1 + 4
  }

  val subTypeAdder = new VectorPointerAdder
  val withAdder    = new VectorPtrWithAdder
  val regAdder     = new VectorPtrLongAdder

  def time: Unit = {
    var longVal = 1000L
    val endLong = startLong + 4 * 1000000
    val startTime = System.nanoTime
    while (longVal < endLong) {
      longVal = regAdder.addr(longVal)
    }
    val endTime = System.nanoTime
    //scalstyle:off
    println(s"One million iterations took ${endTime - startTime} ns or ${(endTime-startTime)/1000000.0} ns per")
  }
}
```

(All measurements taken after a few warmup cycles to allow JIT to work)

* VectorPtrLongAdder - One million iterations took 501270 ns or 0.50127 ns per
* VectorPointerAdder - 9 - 97ns per call, averaging around 50  :(
* VectorPtrWithAdder - 2.4 to 70ns per call.  Pretty big variance.
* VectorValAdder (value class) - One million iterations took 487316 ns or 0.487316 ns per

Unfortunately the only alternative which can consistently even come close to matching the performance of a raw Long (or thinly veiled typedef'd one) are Scala value classes, with all of their warts and all.  The problem is that value classes box rather easily.

### Tips

## Debugging JVM Inlining

First some tips:

* [Enabling -XX:+PrintAssembly](http://psy-lob-saw.blogspot.com/2013/01/java-print-assembly.html) - includes instructions for OSX
* [JMH Resources](http://psy-lob-saw.blogspot.com/p/jmh-related-posts.html)
* [Using JMH and Perfasm to debug Scala](https://shipilev.net/blog/2014/java-scala-divided-we-fail/)
* [Perfasm explained](http://psy-lob-saw.blogspot.com/2015/07/jmh-perfasm.html)
* [Black Magic of Java Method Dispatch](https://shipilev.net/blog/2015/black-magic-method-dispatch/) - a detailed guide about inlining

### -XX:+PrintInlining

After enabling PrintAssembly above, add these options to JMH: `-jvmArgsAppend -XX:+UnlockDiagnosticVMOptions -jvmArgsAppend -XX:+PrintInlining`

You will get a huge amount of output.  Search for what you need and you will find some annotations, showing what calls are inlined and intrinsic too:

```
[info]                               @ 40   filodb.core.query.SumDoublesAggregate::aggregateNoNAs (7 bytes)   inline (hot)
[info]                                 @ 3   filodb.core.query.SumDoublesAggregate::aggregateNoNAs$mcD$sp (54 bytes)   inline (hot)
[info]                                   @ 26   org.velvia.filo.vectors.DoubleIntWrapper::apply$mcD$sp (12 bytes)   inline (hot)
[info]                                     @ 5   org.velvia.filo.vectors.IntBinaryVector$$anon$7::apply$mcI$sp (20 bytes)   inline (hot)
[info]                                      \-> TypeProfile (9488/9488 counts) = org/velvia/filo/vectors/IntBinaryVector$$anon$7
[info]                                       @ 4   org.velvia.filo.vectors.IntBinaryVector::base (5 bytes)   accessor
[info]                                       @ 8   org.velvia.filo.vectors.IntBinaryVector::bufOffset (5 bytes)   inline (hot)
[info]                                       @ 16   org.velvia.filo.UnsafeUtils$::getShort (10 bytes)   inline (hot)
[info]                                         @ 1   org.velvia.filo.UnsafeUtils$::unsafe (5 bytes)   accessor
[info]                                         @ 6   sun.misc.Unsafe::getShort (0 bytes)   (intrinsic)
```

Some notes on the above:

- We can see most methods are inlined along with how big they are.  Thus smaller nested method calls pay off (vs big methods)
- Unsafe accesses are intrinsic
- We can see specialization worked.  The specialized method is called throughout (signatures like `apply$mcI$sp`) and no calls to Box or Unbox

### +XX:MaxInlineLevel and Fixing Inlining Depth

Here's some more inlining output:

```
[info]                                             @ 83   filodb.core.query.TimeGroupingAggregate$mcD$sp::aggNoNAs (8 bytes)   inline (hot)
[info]                                               @ 4   filodb.core.query.TimeGroupingAggregate$mcD$sp::aggNoNAs$mcD$sp (86 bytes)   inline (hot)
[info]                                                 @ 23   org.velvia.filo.vectors.DeltaDeltaVector::apply$mcJ$sp (25 bytes)   inline (hot)
[info]                                                   @ 1   org.velvia.filo.vectors.DeltaDeltaVector::org$velvia$filo$vectors$DeltaDeltaVector$$initValue (5 bytes)   inlining too deep
[info]                                                   @ 5   org.velvia.filo.vectors.DeltaDeltaVector::org$velvia$filo$vectors$DeltaDeltaVector$$slope (5 bytes)   accessor
[info]                                                   @ 13   org.velvia.filo.vectors.DeltaDeltaVector::org$velvia$filo$vectors$DeltaDeltaVector$$inner (5 bytes)   accessor
[info]                                                   @ 17   org.velvia.filo.vectors.IntBinaryVector$$anon$13::apply$mcI$sp (28 bytes)   inlining too deep
[info]                                                    \-> TypeProfile (8781/8781 counts) = org/velvia/filo/vectors/IntBinaryVector$$anon$13
[info]                                                 @ 54   org.velvia.filo.vectors.DoubleIntWrapper::apply$mcD$sp (12 bytes)   inline (hot)
[info]                                                   @ 5   org.velvia.filo.vectors.IntBinaryVector$$anon$7::apply$mcI$sp (20 bytes)   inlining too deep
[info]                                                    \-> TypeProfile (9150/9150 counts) = org/velvia/filo/vectors/IntBinaryVector$$anon$7
[info]                                                 @ 67   filodb.core.query.TimeGroupingAggregate::filodb$core$query$TimeGroupingAggregate$$bucketWidth (5 bytes)   inline (hot)
[info]                                                 @ 72   filodb.core.query.TimeGroupingAvgDoubleAgg::aggregateOne (7 bytes)   inline (hot)
[info]                                                   @ 3   filodb.core.query.TimeGroupingAvgDoubleAgg::aggregateOne$mcD$sp (29 bytes)   inlining too deep
```

Here you see lots of `inlining too deep`'s. What's up with that?  It turns out that by default the JVM will only inline 9 levels.  For certain code this is probably nowhere near enough.   In this case, adding a simple `-XX:MaxInlineLevel=20` boosted the speed by like 30%.

### Other Inlining Tips

- `MaxInlineSize` and `FreqInlineSize` might be good to tune too.  First check the `PrintInlining` output.

## Memory Management

"What resource are you constrained by?"  This is a great question when designing and architecting systems.  You may find, especially for a JVM-based in-memory processing system, that memory, specifically heap memory, is the most precious resource.

- GC is in general much more efficient at clearing lots of temporary objects than lots of permanent objects
- Offheap is much better for long-lived data whose lifecycle you want to control anyways
- Beware of object graphs. This can very easily bloat on heap usage, especially when you have millions of copies of something
- Offheap (fully native) and direct buffer memory are not moved around, so you can obtain C-like pointers and use them safely in code
- Onheap objects are moved around by the JVM GC.  It *is* in theory possible to obtain a native pointer to heap memory, but not worth the cost (see below).  It is not possible to pin onheap objects.
- Possible to use Scala value classes with offheap data to minimize onheap object allocation and usage.  Value classes have their own pain points though.

### Can I Obtain a Pointer for On-Heap Objects?

In short, you can but shouldn't, because on-heap objects get moved around.

TO do so:

```scala
scala> Array("foo", "bah", "blaz")
res0: Array[String] = Array(foo, bah, blaz)

scala> filodb.memory.format.UnsafeUtils.getLong(res0, 16)
res1: Long = -3370045110338506547
```

From here it gets tricky.

- Due to default JDK8 `+UseCompressedOops`, the JVM actually fits TWO object pointers into that 64-bit space.  However this is only true if the JVM can fit everything into a 32GB heap space.
- In general the formula for decompressing is like: `<wide_oop> = <narrow-oop-base> + (<narrow-oop> << 3)`
- This article on [CompressedOops](https://wiki.openjdk.java.net/display/HotSpot/CompressedOops) goes into much more fantastic detail
- The `narrow-oop-base` can be configured (see `-XX:HeapBaseMinAddress=8g`)
- A [StackOverflow review of all the subtleties](https://stackoverflow.com/questions/35411754/java8-xxusecompressedoops-xxobjectalignmentinbytes-16)
- Also see this StackOverflow question on using the sa-jdi.jar Hotspot Serviceability Agent to [programmatically determine the narrow-oop-base and other info](https://stackoverflow.com/questions/46597668/how-to-determine-if-java-heap-is-using-compressed-pointers-and-whether-or-not-re)
- 64 vs 32-bit pointers can very easily be determined from `unsafe.arrayIndexScale(classOf[Array[String]])` - this is 4 if pointer compression is enabled

There is also having to deal with the address moving around.  I found that if you write the object to an object array, then the JVM will actually update the array when the physical address moves.  I suppose if you check it often enough you can always get the newest location.

## Other Perf Tips

- In critical sections and tight inner loops, don't use tuples.  They have an allocation cost and boxing cost too.
