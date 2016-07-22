links
=====

Just a bunch of useful links.  BTW see [rust](rust.md) links as well.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [links](#links)
  - [Scala](#scala)
    - [Serialization / Off-heap Data Structures / Unsafe](#serialization--off-heap-data-structures--unsafe)
    - [Concurrency, Actors](#concurrency-actors)
    - [Reactive Streams / Streaming](#reactive-streams--streaming)
    - [Database Libs](#database-libs)
    - [Caching](#caching)
  - [Big Data Processing](#big-data-processing)
    - [Spark](#spark)
    - [Geospatial and Graph](#geospatial-and-graph)
    - [Collections, Numeric Processing, Fast Loops](#collections-numeric-processing-fast-loops)
    - [Big Data Storage](#big-data-storage)
    - [Distributed Systems](#distributed-systems)
    - [Web / REST / General](#web--rest--general)
    - [Build, Tooling](#build-tooling)
    - [JVM Other](#jvm-other)
  - [Monitoring / Infrastructure](#monitoring--infrastructure)
  - [Databases](#databases)
    - [Indexing and OLAP](#indexing-and-olap)
    - [ML and Data Science](#ml-and-data-science)
  - [Distributed Systems](#distributed-systems-1)
  - [Sublime Text](#sublime-text)
  - [Best Practices and Design](#best-practices-and-design)
  - [Other Random Stuff](#other-random-stuff)
    - [Tips on installing Ruby](#tips-on-installing-ruby)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Scala

* [Scala Design Patterns](https://pavelfatin.com/design-patterns-in-scala/) - great stuff, how you do (or don't) traditional Java / OOP patterns in Scala
* [The Human Side of Scala](http://tech.gilt.com/post/53274999512/the-human-side-of-scala/) - great post on styling Scala for readability
* [Sneaking Scala Through the Back Door](http://www.slideshare.net/diannemarsh/sneaking-scala-through-the-back-door) - how to promote Scala in an organization
* [Effective Scala](http://twitter.github.io/effectivescala/) - Twitter's guide to writing good Scala code
* [Strategic Scala Style: Principle of Least Power](https://lihaoyi.github.io/post/StrategicScalaStylePrincipleofLeastPower.html) - an excellent read about how to choose the path of less complexity and higher readability in the huge landscape that is Scala programming
  * [Designing Data Types](http://www.lihaoyi.com/post/StrategicScalaStyleDesigningDatatypes.html)
* [SBT - a declarative DSL](https://jazzy.id.au/2015/03/04/sbt-declarative-dsl.html) - an excellent guide to SBT tasks and settings
* [SBT Tips and Tricks](http://underscore.io/blog/posts/2015/11/09/sbt-commands.html)
* [Between Zero & Hero](https://speakerdeck.com/agemooij/between-zero-and-hero-scala-tips-and-tricks-for-the-intermediate-scala-developer) - tips and tricks for the intermediate Scala developer
* [Better Type Classes](http://aakashns.github.io/better-type-class.html) - also see one of first links for good intro to type classes
* [Type classes and generic derivation](https://meta.plasm.us/posts/2015/11/08/type-classes-and-generic-derivation/) - How to avoid common boilerplate for type classes and case classes using Shapeless HLists
* [Type of Types](http://ktoso.github.io/scala-types-of-types/) - an unfinished tutorial on the Scala type system
* [Monads are not Metaphors](http://www.codecommit.com/blog/ruby/monads-are-not-metaphors) - a great explanation of monads
* [Selfless Trait Pattern](http://www.artima.com/scalazine/articles/selfless_trait_pattern.html) - allow users to either mix in a Trait or import an Object.
* [Tagged Types](http://blog.scalac.io/2016/05/26/simple-types-in-play.html) - great post from Scalac blog
* [Scalacaster](https://github.com/vkostyukov/scalacaster) - classic data structures in Scala

* Important [compiler flags](http://tpolecat.github.io/2014/04/11/scalac-flags.html)
* [Recursive Types](http://blog.originate.com/blog/2014/02/27/types-inside-types-in-scala/) - signatures like
  `class Foo[T <: Foo[T]]`, useful for inheritance and proper return types.  Tho if you hit this, there are
  probably better ways of solving the problem, ie via composition.
* [Preprocessor](https://github.com/speedcom/preprocessor) - combination of different Scala Types like Phantom Types, Recursive Types, Self Types to make pipeline of computation in typesafe manner

### Serialization / Off-heap Data Structures / Unsafe

* [Scala-offheap](https://github.com/densh/scala-offheap) - fast, safe off heap objects
* [Grisu-scala](https://github.com/rjmac/grisu-scala) - much faster double to string conversion
* [Extracting case class param names](http://tysonjh.com/blog/2014/02/09/scala-macros-accessing-case-class-parameters/) using Macros
* [Metal](https://github.com/denisrosset/metal) - fast unboxed Scala data structures.  Includes a fast no-allocation Pointer type that replaces Iterator.
* [Filo](https://github.com/velvia/filo) - my own library for extremely fast, serialized Scala sequences

Java, not Scala

* [Simple Binary Encoding](https://github.com/real-logic/simple-binary-encoding) - supposedly 20-50x faster than
Google Protobuf !!
* [Comparison of Cap'n Proto, SBE, FlatBuffers](https://kentonv.github.io/capnproto/news/2014-06-17-capnproto-flatbuffers-sbe.html) from the Cap'n Proto people
    - Cap'n Proto [native layout](https://kentonv.github.io/capnproto/encoding.html#) uses 64-bit words, relies on separate packing/unpacking to achieve efficient wire representation.  Has RPC (but not for Java).   Bitset support.  Java is third party support.
    - [Flatbuffers](http://google.github.io/flatbuffers/index.html) is from Google. 32-bit word size, more compact native representation, native Java support.
    - Both Cap'n Proto and Flatbuffers allows random access of lists, whereas SBE is really only for streaming access
* [Using Unsafe for C-like memory access speeds](http://mechanical-sympathy.blogspot.com/2012/07/native-cc-like-performance-for-java.html) - a great guide.  Many Unsafe operations turn into Java intrinsics - which translate to direct machine code
    - Also see [Which Memory is Faster - Heap ByteBuffer or Direct](http://www.javacodegeeks.com/2013/08/which-memory-is-faster-heap-or-bytebuffer-or-direct.html)
* [FastTuple](https://github.com/boundary/fasttuple) - a dynamic (runtime-defined) C-style struct library, with support for off-heap storage.  Only works for primitives right now  :(
    - and the excellent [blog](http://boundary.com/blog/2014/05/15/dynamic-tuple-performance-on-the-jvm/) covers all of the on- and off-heap access and allocation patterns on the JVM very thoroughly.
* [ObjectLayout](http://objectlayout.org/) - efficient struct-within-array data structures
* [jvm-unsafe-utils](https://github.com/rxin/jvm-unsafe-utils) - @rxin of Spark/Shark fame library for working with Unsafe.
* [Agrona](https://github.com/real-logic/Agrona) and [blog post](http://www.insightfullogic.com/2015/Apr/18/agronas-threadsafe-offheap-buffers/) - a ByteBuffer wrapper, off-heap, with atomic / thread-safe update operations. Good for building off heap data structures.
* [Byte-buddy](https://github.com/raphw/byte-buddy), a Java class generation library
* [Sidney](https://github.com/JasonRuckman/sidney) - an experimental columnar nested struct serializer, with Parquet-like repetition counts
* [OHC](https://github.com/snazy/ohc) - Java off-heap cache
* [Boon ByteBuf](https://github.com/boonproject/boon/wiki/Auto-Growable-Byte-Buffer-like-a-ByteBuilder) and the [JavaDoc](http://richardhightower.github.io/site/javadocs/index.html) - a very easy to use, auto-growable ByteBuffer replacement, good for efficient IO
* [Fast-Serialization](https://code.google.com/p/fast-serialization/) - a drop in replacement for Java Serialization but much faster
* [LWJGL](https://www.lwjgl.org) - Potentially useful: very fast off heap memory allocators without limitations of allocateDirect;   OpenCL library 

* [Reed-Solomon Erasure Coding Library](https://www.backblaze.com/blog/reed-solomon/) from Backblaze.  Recover or repair from missing chunks of data; a potential alternative to replication
  - Great paper on [Erasure Coding vs Replication](http://oceanstore.cs.berkeley.edu/publications/papers/pdf/erasure_iptps.pdf)

### Concurrency, Actors

* [Retry for futures](https://github.com/softprops/retry).  Also, [SafeFuture CancellableFuture etc](http://eng.kifi.com/future-safefuture-timeout-cancelable/) - very useful
* [Throttling Scala Futures](http://quantifind.com/blog/2015/06/throttling-instantiations-of-scala-futures-1/) - using a custom executor
* [Futiles](https://github.com/johanandren/futiles) - really useful set of utilities for working with and sequencing Futures, retries, converting between Try, timeouts, etc.
* [Scala.Rx](https://github.com/lihaoyi/scala.rx/blob/master/readme.md) - "Reactive variables" - smart variables who auto-update themselves when the values they depend on change
* [Monifu](https://github.com/alexandru/monifu) - a nice set of wrappers around j.u.c.Atomic, as well as super-lightweight cancellable tasks and futures utilities.  Accompanying [blog post](https://www.bionicspirit.com/blog/2013/05/07/towards-better-atomicreference-scala.html).
* [Scala Coroutines](http://storm-enroute.com/coroutines/) - really neat, coroutines with yield.
* [Demystifying the blocking construct in Scala Futures](http://www.cakesolutions.net/teamblogs/demystifying-the-blocking-construct-in-scala-futures) - great blog explaining not only about the default global ExecutionContext, but choice of thread pool types, and more

* [Colossus](http://tumblr.github.io/colossus/) - an extremely fast, NIO and Akka-based microservice framework. Read [their blog post](http://engineering.tumblr.com/post/102906359034/colossus-a-new-service-framework-from-tumblr).
* [Socko](http://sockoweb.org/) and [Xitrum](http://xitrum-framework.github.io/) - Two very fast web frameworks built on Akka and Netty

* [Kamon](http://kamon.io/) - great looking Actor monitoring using bytecode weaving?  no code change required.
* [akka-tracing](https://github.com/levkhomich/akka-tracing) - A distributed tracing Akka extension based on Twitter's Zipkin, which can be used as performance diagnostics and debugging tool. Supports Spray!
* [DI in Akka](http://di-in-scala.github.io/#akka) - great guide to using MacWire with Akka for DI
* [Akka Cluster Inventory](http://blog.eigengo.com/2014/12/13/akka-cluster-inventory/) extension - very useful.  All the other blog posts in the series are also excellent reads.
* [Akka ZK cluster seed](https://github.com/sclasen/akka-zk-cluster-seed) - another Akka extension to automatically register seed nodes with ZK
* [Akka Data Replication](https://github.com/patriknw/akka-data-replication) - replicated low-latency in memory datastore built using Akka cluster and CRDTs
* [Actor Provisioning pattern](https://gist.github.com/helena/6250995) - if you have a long, failure-prone initialization procedure for an actor, this trait splits out the work, to say another actor and dispatcher
* [Akka mock scheduler](https://github.com/miguno/akka-mock-scheduler) - great for testing!
* [Akka VisualMailbox](https://github.com/ouven/akka-visualmailbox) - Akka traffic patterns visualized in D3
* [Reactive Visualization](https://github.com/timcharper/reactive-viz) for Akka streams!!
* [Akka cluster ordered provisioning and shutdown](https://gist.github.com/helena/6220788)
* Running an [Akka cluster with Docker Containers](http://blog.michaelhamrah.com/2014/03/running-an-akka-cluster-with-docker-containers/)

* [Why Async](http://www.slideshare.net/ktoso/need-for-async-hot-pursuit-for-scalable-internetscale-applications?from_m_app=ios) - An excellent overview of async architecture from Async I/O all the way up to application layer.
* [Ask, Tell, and Per-Request Actors](http://techblog.net-a-porter.com/2013/12/ask-tell-and-per-request-actors/) - why one company moved from Ask/Futures to per-request

* [Dos and Donts deploying Akka in Production](http://boldradius.com/blog-post/U-jexSsAACwA_8nr/dos-and-donts-when-deploying-akka-in-production) - an excellent read, full of advice even for non-Akka JVM apps

* [CKite](https://github.com/pablosmedina/ckite) - Raft Scala implementation, Finagle, MapDB etc.
* [Dirigiste](https://github.com/ztellman/dirigiste/blob/master/README.md) - dynamic scalable / smarter Threadpools
* [Scala-gopher](https://github.com/rssh/scala-gopher) - a #golang-style CSP / channels implementation for Scala.  Other niceties: defer()
* (JAVA) [JCTools](https://github.com/JCTools/JCTools) - very high performance concurrent queues, used by Netty and other projects
* (JAVA) [Windmill](https://github.com/xedin/windmill) - a library for efficient IO/Network processing, Futures based.  Has per-CPU network/IO sockets.

### Reactive Streams / Streaming

* [Akka Streams Extensions](http://mfglabs.github.io/akka-stream-extensions/) - helpers, connectors with PostGres, and more.
* [Reactive Kafka](https://softwaremill.com/reactive-kafka/)
* [Zoom](https://blog.midonet.org/zoom-reactive-programming-zookeeper/) - reactive programming with ZK, in Scala using ReactiveX
* [Akka Streams vs Scalaz Stream](https://softwaremill.com/comparing-akka-stream-scalaz-stream/)

### Database Libs

* [Asyncpools](https://github.com/privateblue/asyncpools) - Akka-based async connection pool for Slick.  Akka 2.2 / Scala 2.10.
* [Postgresql-Async](https://github.com/mauricio/postgresql-async) - Netty-based async drivers for PostgreSQL and MySQL

* [Relate](https://github.com/lucidsoftware/relate) - a very lightweight, fast Scala wrapper on top of JDBC

### Caching

* [Cacheable](https://github.com/cb372/scalacache) - a clever memoization / caching library (with Guava, Redis,
Memcached or EHCache backends) using Scala 2.10 macros to remember function parameters

## Big Data Processing

* Great list of [Big Data Projects](http://blog.andreamostosi.name/big-data/)
* List of [Database Papers](https://github.com/rxin/db-readings)
* List of free [big data sources](http://www.datasciencecentral.com/m/blogpost?id=6448529%3ABlogPost%3A244056) - includes some Socrata datasets, climate data, data from Google, tweets, etc.
* Debasish G's list of [streaming papers and algorithms](https://gist.github.com//debasishg/8172796) - esp stuff on CountMinSketch and HyperLogLog
* [Cubert](http://linkedin.github.io/Cubert/) - CUBE operator + fast "cost-based" block storage on Hadoop / Tez/ Spark
* [Kylin](http://www.kylin.io/) - OLAP CUBEs from HIVE tables, includes query layer
* [Aesop](https://github.com/Flipkart/aesop) - a scalable pub-sub / change propagation system, esp between different datastores, with reliability. Based on LinkedIn DataBus, suports pull or push producers.
* [Making Zookeeper Resilient](http://blog.cloudera.com/blog/2014/03/zookeeper-resilience-at-pinterest/), an excellent blog post from Pinterest
* [ImpalaToGo](https://github.com/ImpalaToGo/ImpalaToGo) - run Cloudera Impala directly on S3 files without HDFS!
* [Calcite](http://calcite.apache.org/) - new Apache project, offers ANSI SQL syntax over regular files and other input sources
* [redash.io](http://redash.io/) - data visualization / collaboration.  TODO: integrate this with Spark SQL / Hive...

* [Fast SQL Query Parser in Scala](http://scala-lms.github.io/tutorials/query.html) - based on the Scala-LMS project, compiles a query down to C!
* [Probability Monad](https://github.com/jliszka/probability-monad) - super useful for stats or random data generation
* [stringmetric](https://rockymadden.com/stringmetric/) - Approximate string matching and phonetic algorithms
* [Factorie](https://github.com/factorie/factorie) - a Scala library for Natural Language Processing based on factor graphs

### Spark
* [spark-jobserver](https://github.com/spark-jobserver/spark-jobserver) - REST Job Server for Spark jobs; low-latency query server
* [docker-spark](https://github.com/kushalmangtani/docker-spark) to easily deploy a Spark cluster
* Andy's [Spark Notebook](https://github.com/andypetrella/spark-notebook/)
* [Magellan](https://github.com/harsha2010/magellan) - Geospatial analytics on Spark
* [Kafka Spark Consumer](https://github.com/dibbhatt/kafka-spark-consumer) - a low-level consumer which avoids the data loss issues with the high level consumer built into Spark Streaming
* [Tuning Spark Streaming](http://www.virdata.com/tuning-spark/) for throughput
* [SparkInternals](https://github.com/JerryLead/SparkInternals) - extremely detailed description of how Spark internals work
* [Supplemental Spark Projects](https://cwiki.apache.org/confluence/display/SPARK/Supplemental+Spark+Projects) - lots of other interesting projects, including IPython notebooks, dataframe stuff, stream + historical data processing, and more.
* [Salt](https://github.com/unchartedsoftware/salt) - Scala/Spark tile generation/visualization for big datasets.  Cool!
* [Spatial Spark](http://simin.me/projects/spatialspark/) - spatial joins in Spark
* [Flinkrock](https://github.com/nchammas/flintrock) - scripts to deploy Spark clusters on AWS

### Geospatial and Graph
* [GeoTrellis](http://geotrellis.io) - distributed raster processing on Spark. Also see [GeoMesa](http://www.geomesa.org/) - distributed vector database + feature filtering
* [ApertureTiles](http://aperturetiles.com/) - system using Spark to generate a tile pyramid for interactive analytical geo exploration
* [Twofishes](http://twofishes.net/) - Foursquare's Scala-based coarse forward and reverse geocoder

* [trails](https://github.com/danielkroeni/trails/blob/master/README.md) - parser combinators for graph traversal.  Supports Tinker/Blueprints/Neo4j APIs.
* [scala-graph](http://www.scala-graph.org/) - in-memory graph API based on scala collections. Work in progress.

### Collections, Numeric Processing, Fast Loops

* [Breeze](https://github.com/dlwh/breeze/), [Spire](https://github.com/non/spire), and [Saddle](http://saddle.github.io/) - Scala numeric libraries
  * [spire-ops](https://github.com/typelevel/machinist) - a set of macros for no-overhead implicit operator enrichment
* [Framian](https://github.com/tixxit/framian) - a new data frame implementation from the authors of Spire
* [Scala DataTable](https://github.com/martincooper/scala-datatable) - An immutable, updatable table with heterogenous types of columns. Easily add columns or rows, and have easy Scala collection APIs for iteration.
* [ScalaXY](https://github.com/nativelibs4java/Scalaxy) - collection of macros for performant for loops, extension methods etc
* [Squants](http://www.squants.com/) - The Scala API for Quantities, Units of Measure and Dimensional Analysis
* An immutable [priority map](http://www.ummels.de/2014/12/14/priority-maps-in-scala/) for Scala
* [Unboxing, Runtime Specialization](http://pchiusano.blogspot.com/2013/07/runtime-specialization-unboxing-and.html?utm_source=twitterfeed&utm_medium=twitter&m=1) - a cool post on how to do really fast aggregations using unboxed integers
* [product-collections](https://github.com/marklister/product-collections) - useful library for working with collections of tuples. Also, great strongly-typed CSV parser.
* [SuperFastHash](http://www.azillionmonkeys.com/qed/hash.html) - also see Murmur3
* [LZ4-Java](https://github.com/jpountz/lz4-java) - very fast compression, but also has version of XXHash - much faster than even Murmur3
* [bloom-filter-scala](https://github.com/alexandrnikitin/bloom-filter-scala) - and accompanying [blog post](https://alexandrnikitin.github.io/blog/bloom-filter-for-scala/?platform=hootsuite) explaining why it's the fastest bloom filter in the JVM

### Big Data Storage

* [Constructr](https://github.com/hseeberger/constructr) - coordinated cluster construction / bootstrapping using etcd/consul as discovery service, for Akka, Cassandra (takes care of registration/CAS/discovery protocol)

* [Phantom](http://websudos.github.io/phantom/) - Scala DSL for Cassandra, supports CQL3 collections, CQL generation from data models, async API based on Datastax driver
* [Athena](https://github.com/vast-engineering/athena/) - Asynchronous Cassandra client built on Akka-IO
* [CCM](https://github.com/pcmanus/ccm) - easily build local Cassandra clusters for testing!
* [SSTableAttachedSecondaryIndex](https://github.com/xedin/sasi) - Improved Cassandra 2i, OR and many other enhancements.  Requires modified C* build.
* [Stubbed Cassandra](http://www.scassandra.org/) - super useful for testing C* apps
* [Pithos](https://github.com/exoscale/pithos) - an S3-API-compatible object store for Cassandra
* [Doradus](https://github.com/dell-oss/Doradus) - A Graph / OLAP store on top of Cassandra
* [Khronus](https://github.com/Searchlight/khronus) - Time series DB built on Cassandra + Akka Cluster
* [Stratio-Cassandra](https://github.com/Stratio/stratio-cassandra) - a fork with Lucene full-text search and CQL support (see the [blog](http://www.openstratio.org/blog/advanced-search-in-cassandra/)).  Also see [Stargate](http://tuplejump.github.io/stargate/).
* [How CQL maps to Cassandra Internal Storage](http://www.slideshare.net/DataStax/understanding-how-cql3-maps-to-cassandras-internal-data-structure)
* [Cassandra Compaction and Tombstoning](http://engblog.polyvore.com/2015/03/cassandra-compaction-and-tombstone.html)

* [Sirius](http://comcast.github.io/sirius/overview.html?attempt=2) - Akka-based in-memory fast key-value store for JVM objects, with Paxos consistency, persistence/txn logs, HA recovery
* [CurioDB](https://github.com/stephenmcd/curiodb/blob/master/README.md) - distributed persistent Redis built on Akka cluster, etc.  :)
* [Ivory](https://github.com/ambiata/ivory) - An immutable, versioned, RDF-triple / fact store for feature extraction / machine learning
* [Hibari](https://github.com/hibari/hibari) - ordered key-value store using chain replicaton for strong consistency
* [Storehaus](https://github.com/twitter/storehaus) - Twitter's key-value wrapper around Redis, MySql, and other stores. Has a neat merge() functionality for aggregation of values, lists, etc.
* [ArDB](https://github.com/yinqiwen/ardb) - like Redis, but with spatial indexes, and pluggable storage engines
* [MapDB](http://www.mapdb.org/) - Not a database, but rather a database engine with tunable consistency / ACIDness; support for off-heap memory;  fast performance;  indexing and other features.
* [HPaste](https://github.com/GravityLabs/HPaste) - a nice Scala client for HBase

* [OctopusDB paper](http://www.cidrdb.org/cidr2011/Papers/CIDR11_Paper25.pdf) - interesting idea of using a WAL of RDF triples as the primary storage, with secondary views of row or column orientation

### Distributed Systems

* An excellent [talk on Akka Cluster and distributed systems](http://www.slideshare.net/jboner/the-road-to-akka-cluster-and-beyond) from Jonas Boner, including summary of lots of distributed systems theory

### Web / REST / General

* [Scalaj-http](https://github.com/scalaj/scalaj-http) - really simple REST API.  Although, the latest Spray-client has been vastly simplified as well.
* [Quick Start to Twitter Finagle](http://reactive.xploregroup.be/blog/11/Building-a-Microservice-with-Twitter's-Finagle-Quick-Start?utm_content=buffera8cc3&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer) - though one should really look into [Finatra](http://reactive.xploregroup.be/blog/11/Building-a-Microservice-with-Twitter's-Finagle-Quick-Start?utm_content=buffera8cc3&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer)
* [REPL as a service](https://github.com/mergeconflict/consolation) - would be kick ass if integrated into Spark
* [Enumeratum](https://github.com/lloydmeta/enumeratum/blob/master/README.md) - a Scala Enum library, much better than built in Enumeration
* [Ammonite](https://github.com/lihaoyi/Ammonite) - Scala DSL for easy BASH-like filesystem operations
* [IScala](https://github.com/mattpap/IScala) - Scala backend for IPython.  Looks promising.  There is also [Scala Notebook](http://technically.us/sketchbook/Sketching+with+Scala+Notebook.html) but it's more of a research project.
* [Scaposer](https://github.com/xitrum-framework/scaposer) - i18n / .po file library
* [Adding Reflection to Scala Macros](http://imranrashid.com/posts/scala-reflection/) - example of using reflection in an annotation macro to add automatic ByteBuffer serialization to case classes :)
* [Scaldi](http://scaldi.github.io/scaldi/Scaldi.html) - A lightweight dependency injection library, with
  [Akka integration](http://hacking-scala.org/post/79931102837/dependency-injection-in-akka-with-scaldi)
* [Knobs](http://oncue.github.io/knobs/) - Scala config library with reactive change detection, env var substitution, can read from Typesafe Config/HOCON, ZK, AWS

* How to use [Typesafe Config](http://blog.michaelhamrah.com/2014/02/leveraging-typesafes-config-library-across-environments/) across multiple environments

* [lamma.io](http://www.lamma.io/) - the easiest date generation library
* [Pimpathon](https://github.com/stacycurl/pimpathon) - a set of useful pimp-my-library extensions
* [Scala-rainbow](https://github.com/ktoso/scala-rainbow) - super simple terminal color output, easier than Console.XXX

### Build, Tooling

* [Run Scala scripts with dependencies](http://www.scala-sbt.org/release/docs/Detailed-Topics/Scripts) - ie you don't need a project file
* sbt-assembly [0.10.2](http://notes.implicit.ly/post/72263234118/sbt-assembly-0-10-2) supports adding a shell script to your jar to make it executable!  No more "java ...." to start your Scala program, and no more `ps ax | grep java | grep ....`
* [acyclic](https://github.com/lihaoyi/acyclic) - a Compiler plugin to detect cylical dependencies between source files.  Eliminate them for faster builds!
* Other useful SBT plugins - [sbt-sonatype](https://github.com/xerial/sbt-sonatype), [sbt-pom-reader](https://github.com/sbt/sbt-pom-reader), [sbt-sound](https://github.com/orrsella/sbt-sound), [plugins page](http://www.scala-sbt.org/release/docs/Community/Community-Plugins.html)
* [sbt-big-project](https://github.com/fommil/sbt-big-project/tree/v1.0.0) - a plugin to speed up compilation when there are hundreds of projects
* [Coursier](https://github.com/alexarchambault/coursier) - a much improved jar dependency fetcher, written in pure Scala.  Has SBT plugin, programmatic API
* [SCoverage](https://github.com/scoverage) - *statement* coverage tool, much more useful than line-based or branch-based tools.  Has SBT plugin.  [Blog post](https://coderwall.com/p/_l-zhw) on why it's an improvement.
* [sbt-jmh](https://github.com/ktoso/sbt-jmh/blob/master/README.md) - Plugin for running SBT projects with the JMH microbench profiling tool.  Also see [jmh-profilers](https://github.com/biboudis/jmh-profilers) project.
  - A list of [JMH Resources](http://psy-lob-saw.blogspot.com/p/jmh-related-posts.html)
  - [JMH Scala vs Java](http://shipilev.net/blog/2014/java-scala-divided-we-fail/#_java_stack_profilers) - Shipilev analyzes Java vs Scala tail recursion
* [sbt-jol](https://github.com/ktoso/sbt-jol) - inspect Scala/Java object memory layout
* [Comcast](https://github.com/tylertreat/Comcast) - a tool to inject network latency, and less-severe issues
* [CharybdeFS](https://github.com/scylladb/charybdefs) - FUSE layer to inject filesystem faults for testing

* [Adaptive microbenchmarking of big data](http://www.autoletics.com/posts/microbenchmarking-big-data-solutions-on-the-jvm-part-1) - really neat JVM agent which allows turning benchmarking code on and off for better benchmarking
* [SBT updates](https://github.com/rtimush/sbt-updates) - Tool for discovering updated versions of SBT dependencies
* [Twitter Iago](https://github.com/twitter/iago) - Perf load test tool based on replaying logs.  Compare vs [Gatling](http://gatling.io) for example.
* [Thyme and Parsley](https://github.com/Ichoran/thyme) - microbenchmarking and profiling tools, seems useful
* [ScalaStyle](http://www.scalastyle.org/) - Scala style checker / linter
* [Towards a Safer Scala](http://tinyurl.com/pnwslint) - great talk/slides on tools for Scala linting and static analysis
* [utest](https://github.com/lihaoyi/utest) - a small micro test framework
* [lions share](https://t.co/QD6SrK4d4u) - a neat JVM heap and GC analysis tool, with charts and SBT integration.

SBuild seems like a promising replacement for SBT.  Still Scala, but much much simpler, more like Scala version of Make.  With MVN dependency and ScalaTest support.

* [SBuild Example](https://github.com/lefou/domino/blob/master/SBuild.scala)
* [SBuild Home Page](http://sbuild.tototec.de/sbuild/projects/sbuild/wiki/Wiki)

### JVM Other

* [HotSwapAgent](http://www.hotswapagent.org/) - dynamic reload for standard Java frameworks, needs some plugin
* [Swiss Java Knife](https://github.com/aragozin/jvm-tools) - super handy collection of JVM tools.  Try `java -jar sjk.jar ttop -p PID -o CPU -n 10` for regular reporting of the top 10 threads by CPU usage!
* [-XX:+PerfDisableSharedMem](http://www.evanjones.ca/jvm-mmap-pause.html)
* [Al's Guide to Cassandra 2.1 Ops](https://tobert.github.io/pages/als-cassandra-21-tuning-guide.html) - awesome, not just for C* but tools in general
* Al Tobey's flags for running JDK8 apps.  Note: G1GC!  Also no need for `MaxPermSize` anymore:
        `-Xmx8G -Xms8G -Xss256k -XX:+UseG1GC -XX:MaxGCPauseMillis=200 -XX:InitiatingHeapOccupancyPercent=0`
* [Tuning Spark apps for GC](https://databricks.com/blog/2015/05/28/tuning-java-garbage-collection-for-spark-applications.html) - excellent write-up from Intel
* [Perils of writing isolating classloaders](http://nuhk.blogspot.com/2008/03/perils-of-writing-isolated-classloader.html) - Good read, tips on how to write a classloader that can isolate and load different versions of the same classes
* [Quick dumping your JVM heap using GDB](http://blogs.atlassian.com/2013/03/so-you-want-your-jvms-heap/) -- too bad it doesn't work on OSX.
* Start a JMX agent in running JVM: `jcmd <pid> ManagementAgent.start jmxremote.port=26010 jmxremote.ssl=false jmxremote.authenticate=false`
* [HeapAudit](https://github.com/foursquare/heapaudit) - A Java agent for lightweight production heap profiling
* [Lion's Share](https://github.com/fommil/lions-share) - tools for memory analysis, outputs Google Charts compatible output
* [jHiccup](http://www.azul.com/downloads/jhiccup/) -- "Hiccup" or GC pause analysis tool
* [Bintray](https://bintray.com/) - friendlier alternative to Sonatype OSS / Maven central.  Also see [bintray-sbt](https://github.com/softprops/bintray-sbt) plugin.
* [Changing JVM flags live](http://nonfunctionaltestingtools.blogspot.co.uk/2012/11/enabling-gc-activity-logging-without.html?m=1) - such as enabling GC logging without restarting JVM. Cool!

## Monitoring / Infrastructure

* [DLite](https://github.com/nlf/dlite) - Easier way to run Docker on OSX
* [Keywhiz](https://corner.squareup.com/2015/04/keywhiz.html) - a store for infrastructure secrets
* [Ranwhen](https://github.com/p-e-w/ranwhen) - Visualize when your system was running, graphs in Terminal
* [HTrace](http://htrace.org/) - distributed tracing library, can dump data to Zipkin or HBase
* [cass_top](http://www.jebriggs.com/blog/2014/09/top-utility-for-cassandra-clusters-cass_top/) - simple top utility for cass clusters
* [Grafana](http://grafana.org/) and [Graphene](http://jondot.github.io/graphene/) - great replacement UIs for the clunky default Graphite UI
* [Elastic Mesos](https://elastic.mesosphere.io/) - create Mesos clusters on AWS with ZK, HDFS
* [Clustering Graphite](http://grey-boundary.com/the-architecture-of-clustering-graphite/) - in depth look at how to scale out Graphite clusters

## Databases

### Indexing and OLAP

* [Adaptive Radix Trees](http://www-db.in.tum.de/~leis/papers/ART.pdf) - cache friendly indexing for in-memory databases
* [Nanocubes](http://getprismatic.com/story/1413038758684?share=MzAxNDE.MTQxMzAzODc1ODY4NA.QfCHBvwG6MuLbubytTgXqm0gn4w) - Fast visualization of large spatiotemporal datasets.  Amazing stuff.  [Paper](http://nanocubes.net/assets/pdf/nanocubes_paper.pdf) and [Github repo](https://github.com/laurolins/nanocube).
* [Quotient Cubes](http://www.vldb.org/conf/2002/S22P02.pdf) - semantic grouping and rollup algorithm for OLAP cubes.  [Ruby implementation](https://github.com/besquared/quotient-cube).
* [Top K queries and cubes](http://www1.se.cuhk.edu.hk/~hcheng/paper/vldb06_rankcube.pdf)
* [Scalable In-memory Aggregation](http://www.doc.ic.ac.uk/teaching/distinguished-projects/2011/r.kopaczyk.pdf) - column-oriented, in memory with bitmap indexing and memoization

### ML and Data Science

* [Visual Introduction to Machine Learning](http://www.r2d3.us/visual-intro-to-machine-learning-part-1/) - beautiful and a quick read, using D3 animation
* [LearnDS](http://learnds.com) - A set of IPython notebooks for learning data science
* [Machine Learning for developers](http://xyclade.github.io/MachineLearning/)

## Distributed Systems

* [Achieving Great Response Times in Distributed Systems](http://static.googleusercontent.com/media/research.google.com/en/us/people/jeff/Berkeley-Latency-Mar2012.pdf) - an excellent talk on how the 99%-tile latency can kill, and techniques to tame it
* [Raft Visualization](http://thesecretlivesofdata.com/raft/) - great 5-min visualization of the distributed consensus protocol

## Sublime Text

I love Sublime and use it for everything, even Scala!  Going to put my Sublime stuff in a [separate page](sublime.md).

## Best Practices and Design

* [Semver](http://semver.org/) - Semantic versioning, how to deal with dev workflows and corner cases -- a must read
* [Pragmatic RESTful API Design](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api) - really good stuff
* [Blameless Post-Mortems](http://www.paperplanes.de/2014/6/20/what-blameless-postmortem-taught-me.html) - why they are crucial to good culture
* [How to Pair with Jr Devs](https://devmynd.com/blog/2015-1-pairing-with-junior-developers/) - really good advice.  Make them type.  Listen and be on the same level.
* [GitHub Flow](http://scottchacon.com/2011/08/31/github-flow.html) - how github.com does continuous deploys, uses pull requests for an automated, process-free development workflow.  Some gems include naming branches descriptively and using github.com to browse the work currently in progress by looking at active branches.
* [Pull Requests and other good Github Practices](http://codeinthehole.com/writing/pull-requests-and-other-good-practices-for-teams-using-github/)

## Other Random Stuff

* [A list of great docs](https://github.com/PharkMillups/beautiful-docs/blob/master/README.md)
* [Awesome public datasets](https://github.com/caesar0301/awesome-public-datasets) - no doubt some are Socrata sites!
* [Mermaid](https://github.com/knsv/mermaid) - think of it as Markdown for diagrams.  Would be awesome to integrate this into reveal.js!
* [Markdeep](http://casual-effects.com/markdeep/) - Markdown++ with diagrams, add single line at bottom to convert to HTML!
* [How To Be a Great Developer](http://funkatron.com/posts/how-to-be-a-great-developer.html) - a reminder to be empathetic, humble, and make lives around us better. Awesome list.

* [JQ](http://stedolan.github.io/jq/) - JSON processor for the shell.  Super useful with RESTful servers.
* [Hub](https://hub.github.com) - CLI for Github :)
* [Underscore-CLI](https://github.com/ddopson/underscore-cli) - a Node-JS based command line JSON parser
* [MacroPy](https://github.com/lihaoyi/macropy) - Scala-like macros, case classes, pattern matching, parser combos for Python (!!)
* [Scala 2.11 vs Swift](https://github.com/densh/talks/raw/master/swift-vs-scala-211-2014-06-03/Swift%20vs%20Scala%202.11.pdf) - Apple's new iOS language is often compared to Scala.
* [Real World OCaml](https://realworldocaml.org/v1/en/html/prologue.html)
* [Gherkin](https://github.com/alandipert/gherkin) - a Lisp implemented in bash !!
* [Nimrod](http://nimrod-lang.org/) - a neat, compile-straight-to-binary, static systems language with beautiful Python-like syntax, union types, generics, macros, first-class functions.  What Go should have been.
* [Pony](http://www.ponylang.org/) - A capabilities-based Actor-centric static language, deadlock-free, null-free, data-race-free!
* [Bret Victor](http://worrydream.com) - A set of excellent essays and talks from a great visual designer

### Tips on installing Ruby

becoz it's so darn painful.

* On OSX: make sure setUID bit is not set on dtrace: `sudo chmod -s /usr/sbin/dtrace` (see [this Homebrew issue](https://github.com/Homebrew/homebrew/issues/32910))
* Try [chruby](https://github.com/postmodern/chruby) and ruby-install instead of rbenv.  Installs rubies into /opt/rubies and lighter weight, also there is a fish shell [chruby-fish](https://github.com/JeanMertz/chruby-fish).
