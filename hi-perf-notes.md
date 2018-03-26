# High-Performance Scala Notes

Some overall notes on JVM performance optimization techniques:

* [JVM Optimization Techniques](https://advancedweb.hu/2016/05/27/jvm_jit_optimization_techniques/)
* [Hybrid JVM Perf Profiling](http://blogs.microsoft.co.il/sasha/2017/07/07/profiling-the-jvm-on-linux-a-hybrid-approach/) - using AGTC and perf on Linux

## Avoiding Exceptions

Throwing exceptions is way too common, especially in Java and Java-ish Scala code.  The problem is that unless it is truly exceptional, exceptions are VERY expensive, in terms of both heap and runtime cost.  

For example, our `BinaryVector` classes originally could throw if trying to add an element beyond the available space for a vector.  The problem is that this is not really exceptional.  Exceeding space is a fairly common use case.  

Redesigning APIs to return proper values is not only more performant, but more functional and easier to test as well.

## Specialization and Boxing

### How scalac conmpiles traits

### Specialized Traits and Classes

### How to Know When Boxing Occurs

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
