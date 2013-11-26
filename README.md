links
=====

Just a bunch of useful links

## Scala

* [Scala Design Patterns](http://pavelfatin.com/design-patterns-in-scala/) - great stuff, how you do (or don't) traditional Java / OOP patterns in Scala
* [The Human Side of Scala](http://tech.gilt.com/post/53274999512/the-human-side-of-scala) - great post on styling Scala for readability
* [Spark, Parquet, and Avro](http://zenfractal.com/2013/08/21/a-powerful-big-data-trio/) - a powerful big data trio
* [Sneaking Scala Through the Back Door](http://www.slideshare.net/diannemarsh/sneaking-scala-through-the-back-door) - how to promote Scala in an organization
* [Effective Scala](http://twitter.github.io/effectivescala/) - Twitter's guide to writing good Scala code
* [Between Zero & Hero](https://speakerdeck.com/agemooij/between-zero-and-hero-scala-tips-and-tricks-for-the-intermediate-scala-developer) - tips and tricks for the intermediate Scala developer

### Serialization

* [scala-pickling](https://github.com/scala/pickling) might become part of Scala standard library.  Really neat project.  Also see the [slides](https://speakerdeck.com/heathermiller/on-pickles-and-spores-improving-support-for-distributed-programming-in-scala).
    * TODO: make msgpack4s implement the Pickling interface
* [jsonpickler](https://github.com/teigen/jsonpicklers/blob/master/src/test/scala/calendar/CalendarList.scala)

### Concurrency, Actors

* [Retry for futures](https://github.com/softprops/retry)
* [SafeFuture CancellableFuture etc](http://eng.42go.com/future-safefuture-timeout-cancelable/) - very useful
* [Execute Futures serially](http://www.michaelpollmeier.com/execute-scala-futures-in-serial-one-after-the-other-non-blocking/) - in nonblocking fashion
* [scala-atomic](https://github.com/alexandru/scala-atomic) - a nice set of wrappers around j.u.c.Atomic\*.  Accompanying [blog post](https://www.bionicspirit.com/blog/2013/05/07/towards-better-atomicreference-scala.html).

* [akka instrumentation](https://github.com/vatel/scala-akka-monitoring) - an experiment to walk the actor tree and see stuff at runtime
* [Actor Provisioning pattern](https://gist.github.com/helena/6250995) - if you have a long, failure-prone initialization procedure for an actor, this trait splits out the work, to say another actor and dispatcher
* [Akka cluster ordered provisioning and shutdown](https://gist.github.com/helena/6220788) - from the great Helena Edelson
* [Monitoring Akka](http://www.cakesolutions.net/teamblogs/2013/11/01/monitoring-akka/) - using AspectJ, they instrument the mailboxes etc.  Interesting alternative.

### Async Database Libs

* [Asyncpools](https://github.com/privateblue/asyncpools) - Akka-based async connection pool for Slick.  Akka 2.2 / Scala 2.10.
* [Postgresql-Async](https://github.com/mauricio/postgresql-async) - Netty-based async drivers for PostgreSQL and MySQL

## Big Data Processing

* Great list of [Big Data Projects](http://blog.andreamostosi.name/big-data/)
* [Summingbird](https://github.com/twitter/summingbird) - For any dataset that can be aggregated using a monoid, promises to unify Storm, Hadoop, and in the future, Akka and Spark with a single DSL.  Also has a neat library of monoids built in.

* [ScalaXY](https://github.com/ochafik/Scalaxy) - collection of macros for performant for loops, extension methods etc
* [Scala-blitz](http://scala-blitz.github.io/) - A new "lightning fast" parallel collections framework
* [Unboxing, Runtime Specialization](http://pchiusano.blogspot.com/2013/07/runtime-specialization-unboxing-and.html?utm_source=twitterfeed&utm_medium=twitter&m=1) - a cool post on how to do really fast aggregations using unboxed integers
* [Archery](http://making.meetup.com/post/64387936554/archery-an-immutable-r-tree-for-scala) - immutable R-tree library for fast geo/XY searches
* [trails](https://github.com/danielkroeni/trails/blob/master/README.md) - parser combinators for graph traversal.  Supports Tinker/Blueprints/Neo4j APIs.

* [stringmetric](http://rockymadden.com/stringmetric/) - Approximate string matching and phonetic algorithms
* [Factorie](https://github.com/factorie/factorie) - a Scala library for Natural Language Processing


## Big Data Storage

* [Storehaus](https://github.com/twitter/storehaus) - Twitter's key-value wrapper around Redis, MySql, and other stores. Has a neat merge() functionality for aggregation of values, lists, etc.
* [HPaste](https://github.com/GravityLabs/HPaste) - a nice Scala client for HBase

### Web / REST / General

* [Scalaj-http](https://github.com/scalaj/scalaj-http) - really simple REST API.  Although, the latest Spray-client has been vastly simplified as well.
* [REPL as a service](https://github.com/mergeconflict/consolation) - would be kick ass if integrated into Spark
* [IScala](https://github.com/mattpap/IScala) - Scala backend for IPython.  Looks promising.  There is also [Scala Notebook](http://technically.us/sketchbook/Sketching+with+Scala+Notebook.html) but it's more of a research project.
* [product-collections](https://github.com/marklister/product-collections) - useful library for working with collections of tuples
* [Heterogeneous maps in Scala](http://stackoverflow.com/questions/17684023/different-types-in-map-scala/18287852#18287852)
* [Scaposer](https://github.com/ngocdaothanh/scaposer) - i18n / .po file library

### Build, Tooling

* [Run Scala scripts with dependencies](http://www.scala-sbt.org/release/docs/Detailed-Topics/Scripts) - ie you don't need a project file

* [SBT Shell Prompt](https://github.com/novus/salat/commit/4e1c11e4e72da75f3bef0da28f59048225f4bd74#commitcomment-4037192) with Git and project name :) (SBT 0.13 only)
* [SBT updates](https://github.com/rtimush/sbt-updates) - Tool for discovering updated versions of SBT dependencies
* [Thyme and Parsley](https://github.com/Ichoran/thyme) - microbenchmarking and profiling tools, seems useful
* [ScalaStyle](http://www.scalastyle.org/) - Scala style checker / linter
* [Linter](https://github.com/HairyFotr/linter) - Scala linter compiler plugin
* [scala type debugger](http://lampwww.epfl.ch/~plocinic/type-debugger-tutorial/tutorial.html) - Still in alpha, but a great UI to explore how scalac type system works, and debug compilation problems in your code

SBuild seems like a promising replacement for SBT.  Still Scala, but much much simpler, more like Scala version of Make.  With MVN dependency and ScalaTest support.

* [SBuild Example](https://github.com/lefou/domino/blob/master/SBuild.scala)
* [SBuild Home Page](http://sbuild.tototec.de/sbuild/projects/sbuild/wiki/Wiki)

### JVM Other

* [Quick dumping your JVM heap using GDB](http://blogs.atlassian.com/2013/03/so-you-want-your-jvms-heap/) -- too bad it doesn't work on OSX.
* [jHiccup](http://www.azulsystems.com/downloads/jHiccup) -- "Hiccup" or GC pause analysis tool

## Databases

### Indexing

* [Adaptive Radix Trees](http://www-db.in.tum.de/~leis/papers/ART.pdf) - cache friendly indexing for in-memory databases
* [Dwarf](http://www.cs.umd.edu/~nick/projects/Dwarf.pdf) - a brilliant algorithm for compressing OLAP data cubes. Also see this [Ruby implementation](https://github.com/activewarehouse/activewarehouse).

## Other Random Stuff

* [JQ](http://stedolan.github.io/jq/) - JSON processor for the shell.  Super useful with RESTful servers.
* [Underscore-CLI](https://github.com/ddopson/underscore-cli) - a Node-JS based command line JSON parser
* [MacroPy](https://github.com/lihaoyi/macropy) - Scala-like macros, case classes, pattern matching, parser combos for Python (!!)
* [Real World OCaml](https://realworldocaml.org/v1/en/html/prologue.html)
* [Clay](https://github.com/jckarter/clay) - an interesting LLVM/C-based language with flexible static types
