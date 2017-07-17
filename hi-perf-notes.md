# High-Performance Scala Notes

Some overall notes on JVM performance optimization techniques:

* [JVM Optimization Techniques](https://advancedweb.hu/2016/05/27/jvm_jit_optimization_techniques/)
* [Hybrid JVM Perf Profiling](http://blogs.microsoft.co.il/sasha/2017/07/07/profiling-the-jvm-on-linux-a-hybrid-approach/) - using AGTC and perf on Linux

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

## Other Perf Tips

- In critical sections and tight inner loops, don't use tuples.  They have an allocation cost and sometimes boxing cost as well.  
