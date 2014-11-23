links
=====

Just a bunch of useful links.  BTW see [rust](rust.md) links as well.

## Scala

* [Scala Design Patterns](http://pavelfatin.com/design-patterns-in-scala/) - great stuff, how you do (or don't) traditional Java / OOP patterns in Scala
* [The Human Side of Scala](http://tech.gilt.com/post/53274999512/the-human-side-of-scala) - great post on styling Scala for readability
* [Sneaking Scala Through the Back Door](http://www.slideshare.net/diannemarsh/sneaking-scala-through-the-back-door) - how to promote Scala in an organization
* [Effective Scala](http://twitter.github.io/effectivescala/) - Twitter's guide to writing good Scala code
* [Between Zero & Hero](https://speakerdeck.com/agemooij/between-zero-and-hero-scala-tips-and-tricks-for-the-intermediate-scala-developer) - tips and tricks for the intermediate Scala developer
* [Type of Types](http://ktoso.github.io/scala-types-of-types/) - an unfinished tutorial on the Scala type system
* [Monads are not Metaphors](http://www.codecommit.com/blog/ruby/monads-are-not-metaphors) - a great explanation of monads

* Important [compiler flags](https://gist.github.com/tpolecat/8812750)
* [Recursive Types](http://blog.originate.com/blog/2014/02/27/types-inside-types-in-scala/) - signatures like
  `class Foo[T <: Foo[T]]`, useful for inheritance and proper return types.  Tho if you hit this, there are
  probably better ways of solving the problem, ie via composition.

### Serialization

* [Simple Binary Encoding](https://github.com/real-logic/simple-binary-encoding) - supposedly 20-50x faster than
Google Protobuf !!
* [Comparison of Cap'n Proto, SBE, FlatBuffers](https://kentonv.github.io/capnproto/news/2014-06-17-capnproto-flatbuffers-sbe.html) from the Cap'n Proto people
* [Jawn](https://github.com/non/jawn) - @d3's new fast JSON parser, parses to multiple ASTs including rojoma-json, spray-json, argonaut
* [Extracting case class param names](http://tysonjh.com/blog/2014/02/09/scala-macros-accessing-case-class-parameters/) using Macros
* [Fast-Serialization](https://code.google.com/p/fast-serialization/) - a drop in replacement for Java Serialization but much faster

### Concurrency, Actors

* [Colossus](http://tumblr.github.io/colossus/) - an extremely fast, NIO and Akka-based microservice framework. Read [their blog post](http://engineering.tumblr.com/post/102906359034/colossus-a-new-service-framework-from-tumblr).
* [Retry for futures](https://github.com/softprops/retry).  Also, [SafeFuture CancellableFuture etc](http://eng.42go.com/future-safefuture-timeout-cancelable/) - very useful
* [Execute Futures serially](http://www.michaelpollmeier.com/execute-scala-futures-in-serial-one-after-the-other-non-blocking/) - in nonblocking fashion
* [Scala.Rx](https://github.com/lihaoyi/scala.rx/blob/master/readme.md) - "Reactive variables" - smart variables who auto-update themselves when the values they depend on change
* [Monifu](https://github.com/alexandru/monifu) - a nice set of wrappers around j.u.c.Atomic, as well as super-lightweight cancellable tasks and futures utilities.  Accompanying [blog post](https://www.bionicspirit.com/blog/2013/05/07/towards-better-atomicreference-scala.html).

* [Kamon](http://kamon.io/) - great looking Actor monitoring using bytecode weaving?  no code change required.
* [Actor Provisioning pattern](https://gist.github.com/helena/6250995) - if you have a long, failure-prone initialization procedure for an actor, this trait splits out the work, to say another actor and dispatcher
* [Akka cluster ordered provisioning and shutdown](https://gist.github.com/helena/6220788)
* Running an [Akka cluster with Docker Containers](http://blog.michaelhamrah.com/2014/03/running-an-akka-cluster-with-docker-containers/)

* [Ask, Tell, and Per-Request Actors](http://techblog.net-a-porter.com/2013/12/ask-tell-and-per-request-actors/) - why one company moved from Ask/Futures to per-request

* [Dos and Donts deploying Akka in Production](http://boldradius.com/blog-post/U-jexSsAACwA_8nr/dos-and-donts-when-deploying-akka-in-production) - an excellent read, full of advice even for non-Akka JVM apps

* [CKite](https://github.com/pablosmedina/ckite) - Raft Scala implementation, Finagle, MapDB etc.
* [Wake](https://github.com/Microsoft-CISL/Wake) - A Java event-driven framework from Microsoft (!)
* [Dirigiste](https://github.com/ztellman/dirigiste/blob/master/README.md) - dynamic scalable / smarter Threadpools
* [Scala-gopher](https://github.com/rssh/scala-gopher) - a #golang-style CSP / channels implementation for Scala.  Other niceties: defer()

### Async Database Libs

* [Asyncpools](https://github.com/privateblue/asyncpools) - Akka-based async connection pool for Slick.  Akka 2.2 / Scala 2.10.
* [Postgresql-Async](https://github.com/mauricio/postgresql-async) - Netty-based async drivers for PostgreSQL and MySQL

### Caching

* [Cacheable](https://github.com/cb372/cacheable) - a clever memoization / caching library (with Guava, Redis,
Memcached or EHCache backends) using Scala 2.10 macros to remember function parameters

## Big Data Processing

* Great list of [Big Data Projects](http://blog.andreamostosi.name/big-data/)
* Debasish G's list of [streaming papers and algorithms](https://gist.github.com//debasishg/8172796) - esp stuff on CountMinSketch and HyperLogLog
* [Summingbird](https://github.com/twitter/summingbird) - For any dataset that can be aggregated using a monoid, promises to unify Storm, Hadoop, and in the future, Akka and Spark with a single DSL.  Also has a neat library of monoids built in.
* [Cubert](http://linkedin.github.io/Cubert/) - CUBE operator + fast "cost-based" block storage on Hadoop / Tez/ Spark
* [Making Zookeeper Resilient](http://blog.cloudera.com/blog/2014/03/zookeeper-resilience-at-pinterest/), an excellent blog post from Pinterest

* [Fast SQL Query Parser in Scala](http://scala-lms.github.io/tutorials/query.html) - based on the Scala-LMS project, compiles a query down to C!
* [Probability Monad](https://github.com/jliszka/probability-monad) - super useful for stats or random data generation
* [stringmetric](http://rockymadden.com/stringmetric/) - Approximate string matching and phonetic algorithms
* [Factorie](https://github.com/factorie/factorie) - a Scala library for Natural Language Processing

### Spark
* [Jaws](http://xpatterns.com/our-spark-sql-rest-server-codename-jaws-is-now-open-source/) - Spark SQL REST server, includes query cancellation, logs, load balancing.  Based originally on my own [spark-jobserver](http://github.com/ooyala/spark-jobserver)
* Andy's [Spark Notebook](https://github.com/andypetrella/spark-notebook/)
* [Supplemental Spark Projects](https://cwiki.apache.org/confluence/display/SPARK/Supplemental+Spark+Projects) - lots of other interesting projects, including IPython notebooks, dataframe stuff, stream + historical data processing, and more.

### Infrastructure
* [Elastic Mesos](https://elastic.mesosphere.io/) - create Mesos clusters on AWS with ZK, HDFS
* [Clustering Graphite](http://grey-boundary.com/the-architecture-of-clustering-graphite/) - in depth look at how to scale out Graphite clusters

### Geospatial and Graph
* [GeoTrellis](http://geotrellis.io) - distributed raster processing, adding Vector/geom support, Akka Cluster and Spark implementations!
* [Spatial framework for Hadoop](https://github.com/Esri/spatial-framework-for-hadoop) - PostGIS-like operators / UDFs for Hive.  We want this for Spark!

* [trails](https://github.com/danielkroeni/trails/blob/master/README.md) - parser combinators for graph traversal.  Supports Tinker/Blueprints/Neo4j APIs.
* [scala-graph](http://www.scala-graph.org/) - in-memory graph API based on scala collections. Work in progress.

### Collections, Numeric Processing, Fast Loops

* [Breeze](https://github.com/dlwh/breeze/), [Spire](http://github.com/non/spire), and [Saddle](http://saddle.github.io/) - Scala numeric libraries
  * [spire-ops](https://github.com/non/spire-ops) - a set of macros for no-overhead implicit operator enrichment
* [ScalaXY](https://github.com/ochafik/Scalaxy) - collection of macros for performant for loops, extension methods etc
* [Squants](http://www.squants.com/) - The Scala API for Quantities, Units of Measure and Dimensional Analysis
* [FastTuple](https://github.com/boundary/fasttuple) - a dynamic (runtime-defined) C-style struct library, with support for off-heap storage.  Would work really well for in-memory queries.
    - and the excellent [blog](http://boundary.com/blog/2014/05/15/dynamic-tuple-performance-on-the-jvm/) covers all of the on- and off-heap access and allocation patterns on the JVM very thoroughly.
* [Unboxing, Runtime Specialization](http://pchiusano.blogspot.com/2013/07/runtime-specialization-unboxing-and.html?utm_source=twitterfeed&utm_medium=twitter&m=1) - a cool post on how to do really fast aggregations using unboxed integers
* [product-collections](https://github.com/marklister/product-collections) - useful library for working with collections of tuples
* [SuperFastHash](http://www.azillionmonkeys.com/qed/hash.html) - also see Murmur3

### Big Data Storage

* [Phantom](http://newzly.github.io/phantom/) - Scala DSL for Cassandra, supports CQL3 collections, CQL generation from data models, async API based on Datastax driver
* [Athena](https://github.com/vast-engineering/athena/) - Asynchronous Cassandra client built on Akka-IO
* [CCM](https://github.com/pcmanus/ccm) - easily build local Cassandra clusters for testing!
* [Stubbed Cassandra](http://www.scassandra.org/) - super useful for testing C* apps
* [Pithos](https://github.com/exoscale/pithos) - an S3-API-compatible object store for Cassandra
* [Stratio-Cassandra](https://github.com/Stratio/stratio-cassandra) - a fork with Lucene full-text search and CQL support.  Also see [Stargate](http://tuplejump.github.io/stargate/).
* [Sirius](http://comcast.github.io/sirius/overview.html?attempt=2) - Akka-based in-memory fast key-value store for JVM objects, with Paxos consistency, persistence/txn logs, HA recovery
* [Storehaus](https://github.com/twitter/storehaus) - Twitter's key-value wrapper around Redis, MySql, and other stores. Has a neat merge() functionality for aggregation of values, lists, etc.
* [MapDB](http://www.mapdb.org/) - Not a database, but rather a database engine with tunable consistency / ACIDness; support for off-heap memory;  fast performance;  indexing and other features.
* [HPaste](https://github.com/GravityLabs/HPaste) - a nice Scala client for HBase

* [OctopusDB paper](http://www.cidrdb.org/cidr2011/Papers/CIDR11_Paper25.pdf) - interesting idea of using a WAL of RDF triples as the primary storage, with secondary views of row or column orientation

### Web / REST / General

* [Scalaj-http](https://github.com/scalaj/scalaj-http) - really simple REST API.  Although, the latest Spray-client has been vastly simplified as well.
* [REPL as a service](https://github.com/mergeconflict/consolation) - would be kick ass if integrated into Spark
* [IScala](https://github.com/mattpap/IScala) - Scala backend for IPython.  Looks promising.  There is also [Scala Notebook](http://technically.us/sketchbook/Sketching+with+Scala+Notebook.html) but it's more of a research project.
* [Scaposer](https://github.com/ngocdaothanh/scaposer) - i18n / .po file library
* [Adding Reflection to Scala Macros](http://imranrashid.com/posts/scala-reflection/) - example of using reflection in an annotation macro to add automatic ByteBuffer serialization to case classes :)
* [Scaldi](http://scaldi.github.io/scaldi/Scaldi.html) - A lightweight dependency injection library, with
  [Akka integration](http://hacking-scala.org/post/79931102837/dependency-injection-in-akka-with-scaldi)
* How to use [Typesafe Config](http://blog.michaelhamrah.com/2014/02/leveraging-typesafes-config-library-across-environments/) across multiple environments

* [lamma.io](http://www.lamma.io/) - the easiest date generation library
* [Pimpathon](https://github.com/stacycurl/pimpathon) - a set of useful pimp-my-library extensions
* [Scala-rainbow](https://github.com/ktoso/scala-rainbow) - super simple terminal color output, easier than Console.XXX

### Build, Tooling

* [Run Scala scripts with dependencies](http://www.scala-sbt.org/release/docs/Detailed-Topics/Scripts) - ie you don't need a project file
* sbt-assembly [0.10.2](http://notes.implicit.ly/post/72263234118/sbt-assembly-0-10-2) supports adding a shell script to your jar to make it executable!  No more "java ...." to start your Scala program, and no more `ps ax | grep java | grep ....`
* Other useful SBT plugins - [sbt-sonatype](https://github.com/xerial/sbt-sonatype), [sbt-pom-reader](https://github.com/sbt/sbt-pom-reader), [sbt-sound](https://github.com/orrsella/sbt-sound), [plugins page](http://www.scala-sbt.org/release/docs/Community/Community-Plugins.html)
* [SCoverage](https://github.com/scoverage) - *statement* coverage tool, much more useful than line-based or branch-based tools.  Has SBT plugin.  [Blog post](https://coderwall.com/p/_l-zhw) on why it's an improvement.
* [sbt-jmh](https://github.com/ktoso/sbt-jmh/blob/master/README.md) - Plugin for running SBT projects with the JMH profiling tool
* [Comcast](https://github.com/tylertreat/Comcast) - a tool to inject network latency, and less-severe issues

* [SBT updates](https://github.com/rtimush/sbt-updates) - Tool for discovering updated versions of SBT dependencies
* [Thyme and Parsley](https://github.com/Ichoran/thyme) - microbenchmarking and profiling tools, seems useful
* [ScalaStyle](http://www.scalastyle.org/) - Scala style checker / linter
* [Towards a Safer Scala](http://tinyurl.com/pnwslint) - great talk/slides on tools for Scala linting and static analysis
* [utest](https://github.com/lihaoyi/utest) - a small micro test framework
* [lions share](https://t.co/QD6SrK4d4u) - a neat JVM heap and GC analysis tool, with charts and SBT integration. 

SBuild seems like a promising replacement for SBT.  Still Scala, but much much simpler, more like Scala version of Make.  With MVN dependency and ScalaTest support.

* [SBuild Example](https://github.com/lefou/domino/blob/master/SBuild.scala)
* [SBuild Home Page](http://sbuild.tototec.de/sbuild/projects/sbuild/wiki/Wiki)

### JVM Other

* [Quick dumping your JVM heap using GDB](http://blogs.atlassian.com/2013/03/so-you-want-your-jvms-heap/) -- too bad it doesn't work on OSX.
* [jHiccup](http://www.azulsystems.com/downloads/jHiccup) -- "Hiccup" or GC pause analysis tool
* [Bintray](http://bintray.com) - friendlier alternative to Sonatype OSS / Maven central.  Also see [bintray-sbt](https://github.com/softprops/bintray-sbt) plugin.

## Monitoring

* [Grafana](http://grafana.org/) and [Graphene](http://jondot.github.io/graphene/) - great replacement UIs for the clunky default Graphite UI

## Databases

### Indexing and OLAP

* [Adaptive Radix Trees](http://www-db.in.tum.de/~leis/papers/ART.pdf) - cache friendly indexing for in-memory databases
* [Nanocubes](http://getprismatic.com/story/1413038758684?share=MzAxNDE.MTQxMzAzODc1ODY4NA.QfCHBvwG6MuLbubytTgXqm0gn4w) - Fast visualization of large spatiotemporal datasets.  Amazing stuff.  [Paper](http://nanocubes.net/assets/pdf/nanocubes_paper.pdf) and [Github repo](https://github.com/laurolins/nanocube).
* [Quotient Cubes](http://www.vldb.org/conf/2002/S22P02.pdf) - semantic grouping and rollup algorithm for OLAP cubes.  [Ruby implementation](https://github.com/besquared/quotient-cube).
* [Top K queries and cubes](http://www1.se.cuhk.edu.hk/~hcheng/paper/vldb06_rankcube.pdf)
* [Scalable In-memory Aggregation](http://www.doc.ic.ac.uk/teaching/distinguished-projects/2011/r.kopaczyk.pdf) - column-oriented, in memory with bitmap indexing and memoization

### ML and Data Science

* [LearnDS](http://learnds.com) - A set of IPython notebooks for learning data science

## Distributed Systems

* [Achieving Great Response Times in Distributed Systems](http://static.googleusercontent.com/media/research.google.com/en/us/people/jeff/Berkeley-Latency-Mar2012.pdf) - an excellent talk on how the 99%-tile latency can kill, and techniques to tame it
* [Raft Visualization](http://thesecretlivesofdata.com/raft/) - great 5-min visualization of the distributed consensus protocol

## Sublime Text

I love Sublime and use it for everything, even Scala!  Going to put my Sublime stuff in a [separate page](sublime.md).

## Best Practices and Design

* [Semver](http://semver.org/) - Semantic versioning, how to deal with dev workflows and corner cases -- a must read
* [Pragmatic RESTful API Design](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api) - really good stuff
* [Blameless Post-Mortems](http://www.paperplanes.de/2014/6/20/what-blameless-postmortem-taught-me.html) - why they are crucial to good culture
* [GitHub Flow](http://scottchacon.com/2011/08/31/github-flow.html) - how github.com does continuous deploys, uses pull requests for an automated, process-free development workflow.  Some gems include naming branches descriptively and using github.com to browse the work currently in progress by looking at active branches.
* [Pull Requests and other good Github Practices](http://codeinthehole.com/writing/pull-requests-and-other-good-practices-for-teams-using-github/)

## Other Random Stuff

* [A list of great docs](https://github.com/PharkMillups/beautiful-docs/blob/master/README.md)
* [How To Be a Great Developer](http://funkatron.com/posts/how-to-be-a-great-developer.html) - a reminder to be empathetic, humble, and make lives around us better. Awesome list.

* [JQ](http://stedolan.github.io/jq/) - JSON processor for the shell.  Super useful with RESTful servers.
* [Underscore-CLI](https://github.com/ddopson/underscore-cli) - a Node-JS based command line JSON parser
* [MacroPy](https://github.com/lihaoyi/macropy) - Scala-like macros, case classes, pattern matching, parser combos for Python (!!)
* [Scala 2.11 vs Swift](https://github.com/densh/talks/raw/master/swift-vs-scala-211-2014-06-03/Swift%20vs%20Scala%202.11.pdf) - Apple's new iOS language is often compared to Scala.
* [Real World OCaml](https://realworldocaml.org/v1/en/html/prologue.html)
* [Gherkin](https://github.com/alandipert/gherkin) - a Lisp implemented in bash !!
* [Nimrod](http://nimrod-lang.org/) - a neat, compile-straight-to-binary, static systems language with beautiful Python-like syntax, union types, generics, macros, first-class functions.  What Go should have been.
* [Bret Victor](http://worrydream.com) - A set of excellent essays and talks from a great visual designer