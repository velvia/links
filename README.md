links
=====

Just a bunch of useful links

## Scala

* [The Human Side of Scala](http://tech.gilt.com/post/53274999512/the-human-side-of-scala) - great post on styling Scala for readability
* [Sneaking Scala Through the Back Door](http://www.slideshare.net/diannemarsh/sneaking-scala-through-the-back-door) - how to promote Scala in an organization

### Serialization

* [scala-pickling](https://github.com/scala/pickling) might become part of Scala standard library.  Really neat project.  Also see the [slides](https://speakerdeck.com/heathermiller/on-pickles-and-spores-improving-support-for-distributed-programming-in-scala).
    * TODO: make msgpack4s implement the Pickling interface
* [jsonpickler](https://github.com/teigen/jsonpicklers/blob/master/src/test/scala/calendar/CalendarList.scala)

### Concurrency

* [Retry for futures](https://github.com/softprops/retry)
* [SafeFuture CancellableFuture etc](http://eng.42go.com/future-safefuture-timeout-cancelable/) - very useful
* [Execute Futures serially](http://www.michaelpollmeier.com/execute-scala-futures-in-serial-one-after-the-other-non-blocking/) - in nonblocking fashion

## Big Data Processing

* [Factorie](https://github.com/factorie/factorie) - a Scala library for Natural Language Processing

* [ScalaXY](https://github.com/ochafik/Scalaxy) - collection of macros for performant for loops, extension methods etc

* [Unboxing, Runtime Specialization](http://pchiusano.blogspot.com/2013/07/runtime-specialization-unboxing-and.html?utm_source=twitterfeed&utm_medium=twitter&m=1) - a cool post on how to do really fast aggregations using unboxed integers

* [stringmetric](http://rockymadden.com/stringmetric/) - Approximate string matching and phonetic algorithms

### Web / REST / General

* [Scalaj-http](https://github.com/scalaj/scalaj-http) - really simple REST API.  Although, the latest Spray-client has been vastly simplified as well.
* [REPL as a service](https://github.com/mergeconflict/consolation) - would be kick ass if integrated into Spark
* [Scala Notebook](http://technically.us/sketchbook/Sketching+with+Scala+Notebook.html) - IPython for Scala.  Including D3 Plots.  Would be pretty kickass integrated with Spark.
* [product-collections](https://github.com/marklister/product-collections) - useful library for working with collections of tuples
* [Heterogeneous maps in Scala](http://stackoverflow.com/questions/17684023/different-types-in-map-scala/18287852#18287852)

### Build, Tooling

* [SBT Shell Prompt](https://github.com/novus/salat/commit/4e1c11e4e72da75f3bef0da28f59048225f4bd74#commitcomment-4037192) with Git and project name :) (SBT 0.13 only)
* [Thyme and Parsley](https://github.com/Ichoran/thyme) - microbenchmarking and profiling tools, seems useful
* [ScalaStyle](http://www.scalastyle.org/) - Scala style checker / linter
* [Linter](https://github.com/jorgeortiz85/linter) - Scala linter compiler plugin
* [scala type debugger](http://lampwww.epfl.ch/~plocinic/type-debugger-tutorial/tutorial.html) - Still in alpha, but a great UI to explore how scalac type system works, and debug compilation problems in your code

SBuild seems like a promising replacement for SBT.  Still Scala, but much much simpler, more like Scala version of Make.  With MVN dependency and ScalaTest support.

* [SBuild Example](https://github.com/lefou/domino/blob/master/SBuild.scala)
* [SBuild Home Page](http://sbuild.tototec.de/sbuild/projects/sbuild/wiki/Wiki)


## Distributed Systems

### Indexing

* [Adaptive Radix Trees](http://www-db.in.tum.de/~leis/papers/ART.pdf) - cache friendly indexing for in-memory databases

## Other Random Stuff

* [MacroPy](https://github.com/lihaoyi/macropy) - Scala-like macros, case classes, pattern matching, parser combos for Python (!!)
* [Clay](https://github.com/jckarter/clay) - an interesting LLVM/C-based language with flexible static types
