links
=====

Just a bunch of useful links

## Scala

### Serialization

* [scala-pickling](https://github.com/scala/pickling) might become part of Scala standard library.  Really neat project.  Also see the [slides](https://speakerdeck.com/heathermiller/on-pickles-and-spores-improving-support-for-distributed-programming-in-scala).
    * TODO: make msgpack4s implement the Pickling interface
* [jsonpickler](https://github.com/teigen/jsonpicklers/blob/master/src/test/scala/calendar/CalendarList.scala)

### Concurrency

* [Retry for futures](https://github.com/softprops/retry)

### Web / REST / General

* [Scalaj-http](https://github.com/scalaj/scalaj-http) - really simple REST API.  Although, the latest Spray-client has been vastly simplified as well.

* [REPL as a service](https://github.com/mergeconflict/consolation) - would be kick ass if integrated into Spark

* [product-collections](https://github.com/marklister/product-collections) - useful library for working with collections of tuples

### Build, Tooling

* [Thyme and Parsley](https://github.com/Ichoran/thyme) - microbenchmarking and profiling tools, seems useful

SBuild seems like a promising replacement for SBT.  Still Scala, but much much simpler, more like Scala version of Make.  With MVN dependency and ScalaTest support.

* [SBuild Example](https://github.com/lefou/domino/blob/master/SBuild.scala)
* [SBuild Home Page](http://sbuild.tototec.de/sbuild/projects/sbuild/wiki/Wiki)


## Distributed Systems

### Indexing

* [Adaptive Radix Trees](http://www-db.in.tum.de/~leis/papers/ART.pdf) - cache friendly indexing for in-memory databases
