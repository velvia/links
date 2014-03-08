links
=====

Just a bunch of useful links

## Scala

* [Scala Design Patterns](http://pavelfatin.com/design-patterns-in-scala/) - great stuff, how you do (or don't) traditional Java / OOP patterns in Scala
* [The Human Side of Scala](http://tech.gilt.com/post/53274999512/the-human-side-of-scala) - great post on styling Scala for readability
* [Sneaking Scala Through the Back Door](http://www.slideshare.net/diannemarsh/sneaking-scala-through-the-back-door) - how to promote Scala in an organization
* [Effective Scala](http://twitter.github.io/effectivescala/) - Twitter's guide to writing good Scala code
* [Between Zero & Hero](https://speakerdeck.com/agemooij/between-zero-and-hero-scala-tips-and-tricks-for-the-intermediate-scala-developer) - tips and tricks for the intermediate Scala developer
* [Scala School 2](https://github.com/twitter/scala_school2) - Twitter's next generation interactive scala tutorial
* [Type of Types](http://ktoso.github.io/scala-types-of-types/) - an unfinished tutorial on the Scala type system
* [Monads are not Metaphors](http://www.codecommit.com/blog/ruby/monads-are-not-metaphors) - a great explanation of monads

* Important [compiler flags](https://gist.github.com/tpolecat/8812750)

### Serialization

* [scala-pickling](https://github.com/scala/pickling) might become part of Scala standard library.  Really neat project.  Also see the [slides](https://speakerdeck.com/heathermiller/on-pickles-and-spores-improving-support-for-distributed-programming-in-scala).
    * TODO: make msgpack4s implement the Pickling interface
* [Extracting case class param names](http://tysonjh.com/blog/2014/02/09/scala-macros-accessing-case-class-parameters/) using Macros
* [Fast-Serialization](https://code.google.com/p/fast-serialization/) - a drop in replacement for Java Serialization but much faster
* Akka's ByteString class - immutable rope class for fast byte additions

### Concurrency, Actors

* [Retry for futures](https://github.com/softprops/retry)
* [SafeFuture CancellableFuture etc](http://eng.42go.com/future-safefuture-timeout-cancelable/) - very useful
* [Execute Futures serially](http://www.michaelpollmeier.com/execute-scala-futures-in-serial-one-after-the-other-non-blocking/) - in nonblocking fashion
* [Scala.Rx](https://github.com/lihaoyi/scala.rx/blob/master/readme.md) - "Reactive variables" - smart variables who auto-update themselves when the values they depend on change
* [scala-atomic](https://github.com/alexandru/scala-atomic) - a nice set of wrappers around j.u.c.Atomic\*.  Accompanying [blog post](https://www.bionicspirit.com/blog/2013/05/07/towards-better-atomicreference-scala.html).
* [Future Perfect](https://github.com/wix/future-perfect) - a set of useful wrappers around Twitter Futures esp retry and other things.
    * Note that the latest Spark code has a cancellable version of Scala's Futures as well, and the Coursera Reactive Programming class has a solution as well

* [akka instrumentation](https://github.com/vatel/scala-akka-monitoring) - an experiment to walk the actor tree and see stuff at runtime
* [Actor Provisioning pattern](https://gist.github.com/helena/6250995) - if you have a long, failure-prone initialization procedure for an actor, this trait splits out the work, to say another actor and dispatcher
* [Akka cluster ordered provisioning and shutdown](https://gist.github.com/helena/6220788) - from the great Helena Edelson
* [Monitoring Akka](http://www.cakesolutions.net/teamblogs/2013/11/01/monitoring-akka/) - using AspectJ, they instrument the mailboxes etc.  Interesting alternative.

* [Ask, Tell, and Per-Request Actors](http://techblog.net-a-porter.com/2013/12/ask-tell-and-per-request-actors/) - why one company moved from Ask/Futures to per-request

### Async Database Libs

* [Asyncpools](https://github.com/privateblue/asyncpools) - Akka-based async connection pool for Slick.  Akka 2.2 / Scala 2.10.
* [Postgresql-Async](https://github.com/mauricio/postgresql-async) - Netty-based async drivers for PostgreSQL and MySQL

## Big Data Processing

* Great list of [Big Data Projects](http://blog.andreamostosi.name/big-data/)
* Debasish G's list of [streaming papers and algorithms](https://gist.github.com//debasishg/8172796) - esp stuff on CountMinSketch and HyperLogLog
* [Summingbird](https://github.com/twitter/summingbird) - For any dataset that can be aggregated using a monoid, promises to unify Storm, Hadoop, and in the future, Akka and Spark with a single DSL.  Also has a neat library of monoids built in.

* [Archery](http://making.meetup.com/post/64387936554/archery-an-immutable-r-tree-for-scala) - immutable R-tree library for fast geo/XY searches
* [trails](https://github.com/danielkroeni/trails/blob/master/README.md) - parser combinators for graph traversal.  Supports Tinker/Blueprints/Neo4j APIs.
* [scala-graph](http://www.scala-graph.org/) - in-memory graph API based on scala collections. Work in progress.
* [Probability Monad](https://github.com/jliszka/probability-monad) - super useful for stats or random data generation

* [stringmetric](http://rockymadden.com/stringmetric/) - Approximate string matching and phonetic algorithms
* [Factorie](https://github.com/factorie/factorie) - a Scala library for Natural Language Processing

### Collections, Numeric Processing, Fast Loops

* [Breeze](https://github.com/dlwh/breeze/), [Spire](http://github.com/non/spire), and [Saddle](http://saddle.github.io/) - Scala numeric libraries
  * [spire-ops](https://github.com/non/spire-ops) - a set of macros for no-overhead implicit operator enrichment
* [ScalaXY](https://github.com/ochafik/Scalaxy) - collection of macros for performant for loops, extension methods etc
* [Unboxing, Runtime Specialization](http://pchiusano.blogspot.com/2013/07/runtime-specialization-unboxing-and.html?utm_source=twitterfeed&utm_medium=twitter&m=1) - a cool post on how to do really fast aggregations using unboxed integers
* [Scala-blitz](http://scala-blitz.github.io/) - A new "lightning fast" parallel collections framework
* [product-collections](https://github.com/marklister/product-collections) - useful library for working with collections of tuples
* [SuperFastHash](http://www.azillionmonkeys.com/qed/hash.html) - also see Murmur3

### Big Data Storage

* [Storehaus](https://github.com/twitter/storehaus) - Twitter's key-value wrapper around Redis, MySql, and other stores. Has a neat merge() functionality for aggregation of values, lists, etc.
* [HPaste](https://github.com/GravityLabs/HPaste) - a nice Scala client for HBase

### Web / REST / General

* [Scalaj-http](https://github.com/scalaj/scalaj-http) - really simple REST API.  Although, the latest Spray-client has been vastly simplified as well.
* [REPL as a service](https://github.com/mergeconflict/consolation) - would be kick ass if integrated into Spark
* [IScala](https://github.com/mattpap/IScala) - Scala backend for IPython.  Looks promising.  There is also [Scala Notebook](http://technically.us/sketchbook/Sketching+with+Scala+Notebook.html) but it's more of a research project.
* [Scaposer](https://github.com/ngocdaothanh/scaposer) - i18n / .po file library
* [Adding Reflection to Scala Macros](http://imranrashid.com/posts/scala-reflection/) - example of using reflection in an annotation macro to add automatic ByteBuffer serialization to case classes :)

* [SExt](https://github.com/nikita-volkov/sext) - Supplies some missing Standard Library functions, like pretty-printing data structures, unfold, etc.
* [ScalaUtils](http://www.scalautils.org/) - ===, !== with tolerance for floats, an OR operator for types for easy validation (`Int Or One[ErrorMessage]`)

### Build, Tooling

* [Run Scala scripts with dependencies](http://www.scala-sbt.org/release/docs/Detailed-Topics/Scripts) - ie you don't need a project file
* sbt-assembly [0.10.2](http://notes.implicit.ly/post/72263234118/sbt-assembly-0-10-2) supports adding a shell script to your jar to make it executable!  No more "java ...." to start your Scala program, and no more `ps ax | grep java | grep ....`
* Other useful SBT plugins - [sbt-sonatype](https://github.com/xerial/sbt-sonatype), [sbt-pom-reader](https://github.com/sbt/sbt-pom-reader), [plugins page](http://www.scala-sbt.org/release/docs/Community/Community-Plugins.html)
* [SCoverage](https://github.com/scoverage) - *statement* coverage tool, much more useful than line-based or branch-based tools.  Has SBT plugin.  [Blog post](https://coderwall.com/p/_l-zhw) on why it's an improvement.

* [SBT Shell Prompt](https://github.com/novus/salat/commit/4e1c11e4e72da75f3bef0da28f59048225f4bd74#commitcomment-4037192) with Git and project name :) (SBT 0.13 only)
* [SBT updates](https://github.com/rtimush/sbt-updates) - Tool for discovering updated versions of SBT dependencies
* [Thyme and Parsley](https://github.com/Ichoran/thyme) - microbenchmarking and profiling tools, seems useful
* [ScalaStyle](http://www.scalastyle.org/) - Scala style checker / linter
* [Linter](https://github.com/HairyFotr/linter) - Scala linter compiler plugin
* [utest](https://github.com/lihaoyi/utest) - a small micro test framework

SBuild seems like a promising replacement for SBT.  Still Scala, but much much simpler, more like Scala version of Make.  With MVN dependency and ScalaTest support.

* [SBuild Example](https://github.com/lefou/domino/blob/master/SBuild.scala)
* [SBuild Home Page](http://sbuild.tototec.de/sbuild/projects/sbuild/wiki/Wiki)

### JVM Other

* [Quick dumping your JVM heap using GDB](http://blogs.atlassian.com/2013/03/so-you-want-your-jvms-heap/) -- too bad it doesn't work on OSX.
* [jHiccup](http://www.azulsystems.com/downloads/jHiccup) -- "Hiccup" or GC pause analysis tool
* [Bintray](http://bintray.com) - friendlier alternative to Sonatype OSS / Maven central.  Also see [bintray-sbt](https://github.com/softprops/bintray-sbt) plugin.

## Databases

### Indexing and OLAP

* [Adaptive Radix Trees](http://www-db.in.tum.de/~leis/papers/ART.pdf) - cache friendly indexing for in-memory databases
* [Dwarf](http://www.cs.umd.edu/~nick/projects/Dwarf.pdf) - a brilliant algorithm for compressing OLAP data cubes. Also see this [Ruby implementation](https://github.com/activewarehouse/activewarehouse).
* [Quotient Cubes](http://www.vldb.org/conf/2002/S22P02.pdf) - semantic grouping and rollup algorithm for OLAP cubes.  [Ruby implementation](https://github.com/besquared/quotient-cube).

### ML and Data Science

* [LearnDS](http://learnds.com) - A set of IPython notebooks for learning data science

## Distributed Systems

* [Raft Visualization](http://thesecretlivesofdata.com/raft/) - great 5-min visualization of the distributed consensus protocol

## Sublime Text

I love Sublime and use it for everything, even Scala!  Going to put my Sublime stuff in a [separate page](sublime.md).

## Other Random Stuff

* [Pragmatic RESTful API Design](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api) - really good stuff
* [JQ](http://stedolan.github.io/jq/) - JSON processor for the shell.  Super useful with RESTful servers.
* [Underscore-CLI](https://github.com/ddopson/underscore-cli) - a Node-JS based command line JSON parser
* [MacroPy](https://github.com/lihaoyi/macropy) - Scala-like macros, case classes, pattern matching, parser combos for Python (!!)
* [Real World OCaml](https://realworldocaml.org/v1/en/html/prologue.html)
* [Nimrod](http://nimrod-lang.org/) - a neat, compile-straight-to-binary, static systems language with beautiful Python-like syntax, union types, generics, macros, first-class functions.  What Go should have been.
* [Bret Victor](http://worrydream.com) - A set of excellent essays and talks from a great visual designer
* [GitHub Flow](http://scottchacon.com/2011/08/31/github-flow.html) - how github.com does continuous deploys, uses pull requests for an automated, process-free development workflow.  Some gems include naming branches descriptively and using github.com to browse the work currently in progress by looking at active branches.
* [Pull Requests and other good Github Practices](http://codeinthehole.com/writing/pull-requests-and-other-good-practices-for-teams-using-github/)