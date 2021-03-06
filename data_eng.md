<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Data Engineering, Databases, Data Structures, ML/DS](#data-engineering-databases-data-structures-mlds)
  - [Indexing, Pagecache, Storage Engines](#indexing-pagecache-storage-engines)
  - [Data Processing Systems](#data-processing-systems)
  - [Graph Processing and storage](#graph-processing-and-storage)
  - [Distributed Systems General](#distributed-systems-general)
  - [Cloud, Kubernetes, Deployment](#cloud-kubernetes-deployment)
  - [Data Structures/Indexing](#data-structuresindexing)
  - [OLAP, Aggregation](#olap-aggregation)
  - [ML and Data Science](#ml-and-data-science)
    - [Python/Pandas](#pythonpandas)
    - [Data Engineering](#data-engineering)
  - [Interesting Datasets, Public Data](#interesting-datasets-public-data)
  - [Telemetry, Time Series, Tracing](#telemetry-time-series-tracing)
  - [Compression](#compression)
  - [I/O and Performance](#io-and-performance)
  - [Logging and String Processing](#logging-and-string-processing)
  - [Data Justice](#data-justice)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Data Engineering, Databases, Data Structures, ML/DS

## Indexing, Pagecache, Storage Engines

* [Adaptive Radix Trees](http://www-db.in.tum.de/~leis/papers/ART.pdf) - cache friendly indexing for in-memory databases
    - [Java implementation](https://github.com/rohansuri/adaptive-radix-tree/blob/master/README.md)
* [HAT-Trie](https://tessil.github.io//2017/06/22/hat-trie.html) - a cache concious trie
* [Bw-Tree](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/bw-tree-icde2013-final.pdf) and [LLAMA](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/llama-vldb2013.pdf) - a new latch-free B-Tree design from Microsoft using delta-update / log-structured techniques and a hybrid latch-free page cache for high write throughput.  Really interesting set of papers for DB storage engine. 

* [The Case for Learned Index Structure](https://ai.google/research/pubs/pub46518) - interesting paper from Google on using DL/ML/AI to create more efficient indexes
* [ALEX](https://dl.acm.org/doi/abs/10.1145/3318464.3389711) - an updatable learned index structure
* [Lucene: The Good Parts](https://blog.parse.ly/post/1691/lucene/) - a great introduction to Lucene, terminology, indexing technology, search vs aggregations, etc.
* [Hyperscan](https://www.hyperscan.io) - Intel's high performance multiple regex matching library

## Data Processing Systems

* [Procella](https://blog.acolyer.org/2019/09/11/procella/) - Google's new super-low-latency distributed SQL query engine to conquer all other query systems, using an innovative new columnar format
* [Timely Dataflow](https://github.com/TimelyDataflow/timely-dataflow) - distributed data-parallel compute engine in Rust, based on the NAIAD paper

* [Improving the Presto Planner](https://prestodb.io/blog/2019/12/23/improve-presto-planner) - aggregation pushdowns in Presto, enabling better usage of DB sources that can handle aggregation

## Graph Processing and storage

* [SQLGraph](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/43287.pdf) - An efficient Relational-Based Property Graph Store
* [Graph Processing in Main-Memory Column Stores](https://tud.qucosa.de/api/qucosa%3A30306/attachment/ATT-0/)

## Distributed Systems General

* [Viewstamped Replication](http://pmg.csail.mit.edu/papers/vr-revisited.pdf) - classic paper by Barbara Liskov
* [CRUSH](https://ceph.com/wp-content/uploads/2016/08/weil-crush-sc06.pdf) - Controlled Replication Under Scalable Hashing - Ceph's algorithm for balancing decentralized object placement with minimal data movement in a storage cluster
* [CALM](https://arxiv.org/abs/1901.01930) - "Consistency as Logical Monotonicity" theorem proves when distributed systems can have consistent, coordination-free behavior.
* [Don't Get Stuck in the CON game](https://pathelland.substack.com/p/dont-get-stuck-in-the-con-game-v2?utm_medium=email&utm_campaign=cta) - Excellent Pat Helland post about CONsistency, CONvergence, CONfluence, why "consistency" is so meaningless, and where things are going
* [Fast, Flexible PAXOS](https://hh360.user.srcf.net/blog/2020/11/fast-flexible-paxos/) - how to get around the leader bottleneck and exchange leader election consensus for less replication
* [Compartmentalized MultiPaxos](https://mwhittaker.github.io/publications/compartmentalized_paxos.pdf)

* [10000 Akka Cluster Nodes and RAPID](https://manuel.bernhardt.io/2020/04/30/10000-node-cluster-with-akka-and-rapid/) - interesting view into the new RAPID cluster membership protocol and how it can scale out peer to peer clusters

* [Local-first Cooperation](https://local-first-cooperation.github.io/website/#relationship-with-other-architectural-building-blocks) - a pattern of distributed resilience by having local groups cooperate without centralized coordination.  Also talks about Reactive.

## Cloud, Kubernetes, Deployment

* [OpenEBS](https://openebs.io) - fast, configurable, elastic block/local storage on any cloud platform running Kube
* [Kubernetes Liveness and Readiness Probes](https://blog.colinbreck.com/kubernetes-liveness-and-readiness-probes-how-to-avoid-shooting-yourself-in-the-foot/) - how to avoid shooting yourself in the foot
* [Armada - Running Millions of Batch Jobs on K8s](https://www.gresearch.co.uk/article/armada-how-to-run-millions-of-batch-jobs-over-thousands-of-compute-nodes-using-kubernetes/)

* [Storage is the Achilles Heel of Containers](https://blog.usejournal.com/storage-is-the-achilles-heel-of-containers-97d0341e8d87) - a good overview of the storage landscape for containerized cloud applications

* [POSH](https://github.com/deeptir18/posh) - a shell for running awk/grep/sed etc on remote cloud storage

## Data Structures/Indexing

* [Counting Quotient Filters](https://blog.acolyer.org/2017/08/08/a-general-purpose-counting-filter-making-every-bit-count/) - much faster at updating and search than Bloom filters, and can count too!  An [implementation in C](https://github.com/vedantk/quotient-filter) exists.
* [Moment-based Quantile Sketches](http://www.bailis.org/papers/moments-vldb2018.pdf) - a paper out of Stanford offering highly efficient alternative to T-Digests for quantile sketches.  Also [repo](https://github.com/stanford-futuredata/momentsketch)
* [DDSketch](https://blog.acolyer.org/2019/09/06/ddsketch/) - "a fast and fully-mergeable quantile sketch with relative-error guarantees"
    - Our research shows DDSketch may use many more buckets than TDigest, but merges much much faster and provides stricter error guarantees.  Memory diff might not be that big in reality as TDigest needs a tree structure.
* [SmoothieMap2](https://medium.com/@leventov/smoothiemap-2-the-lowest-memory-hash-table-ever-6bebd06780a3) - a low-memory implementation of Google SwissTable for the JVM
* [Column Sketches](https://stratos.seas.harvard.edu/files/stratos/files/sketches.pdf) - using histogram and approximate/lossy encodings for really fast indexing/scanning.  Neat.  Does not require data clustering.

* [Efficient Computation of Frequent and Top-K Elements in Data Streams](https://www.cs.ucsb.edu/sites/default/files/docs/reports/2005-23.pdf) - a great overview of techniques, including sketches

* [Memory Layouts for Binary Search](http://cglab.ca/~morin/misc/arraylayout/) shows that using BTrees might be faster than arrays due to CPU caching effects.
* [usort](https://github.com/sisudata/coloring/tree/master/usort) - fast radix/bucket sorting for integers, O(n) compared to quicksort-based O(n log n)

* [FM-Index](https://en.wikipedia.org/wiki/FM-index), a neat structure that allows for fast exact string indexing and counting while compressing original string data at the same time.  There is a Rust [crate](https://crates.io/crates/fm-index)
* [S2](http://s2geometry.io) - Geometry/spatial index library

* [XXH3 - a Speed-Optimized Hashing Algo](http://fastcompression.blogspot.com/2019/03/presenting-xxh3.html) - neat insights into the evolution of hashing, improvements using vectorization, and more!

## OLAP, Aggregation

* [Scalable In-memory Aggregation](http://www.doc.ic.ac.uk/teaching/distinguished-projects/2011/r.kopaczyk.pdf) - column-oriented, in memory with bitmap indexing and memoization
* [Nanocubes](http://getprismatic.com/story/1413038758684?share=MzAxNDE.MTQxMzAzODc1ODY4NA.QfCHBvwG6MuLbubytTgXqm0gn4w) - Fast visualization of large spatiotemporal datasets.  Amazing stuff.  [Paper](http://nanocubes.net/assets/pdf/nanocubes_paper.pdf) and [Github repo](https://github.com/laurolins/nanocube).
* [Quotient Cubes](http://www.vldb.org/conf/2002/S22P02.pdf) - semantic grouping and rollup algorithm for OLAP cubes.  [Ruby implementation](https://github.com/besquared/quotient-cube).
* [Top K queries and cubes](http://www1.se.cuhk.edu.hk/~hcheng/paper/vldb06_rankcube.pdf)

## ML and Data Science

* [Visual Introduction to Machine Learning](http://www.r2d3.us/visual-intro-to-machine-learning-part-1/) - beautiful and a quick read, using D3 animation
* [LearnDS](http://learnds.com) - A set of IPython notebooks for learning data science
* [Machine Learning for developers](http://xyclade.github.io/MachineLearning/)
* [Cognitive Database](https://arxiv.org/pdf/1712.07199.pdf) - Using NLP word embedding techniques to add cognitive, ML/AI capabilities to SQL queries of RDBMSes
* [Useful Resources for DS](https://community.ibm.com/community/user/datascience/blogs/paco-nathan/2019/05/09/useful-resources-for-data-science) by Paco Nathan.  Good list!

* [Getting Started in Data Science](https://gumroad.com/l/getting-started-in-data-science) book with great math intro
* [Teach Your Kids To Code](http://teachyourkidstocode.com) - learning Python for kids

Time Series ML

* [LSTM Neural Networks for Anomaly Detection](https://medium.com/datadriveninvestor/lstm-neural-networks-for-anomaly-detection-4328cb9b6e27) - really relevant to time series analysis
* [Machine Learning for Predictive Maintenance](https://medium.com/bigdatarepublic/machine-learning-for-predictive-maintenance-where-to-start-5f3b7586acfb)
* [Autoencoders for Stock-Market Time Series Compression](https://towardsdatascience.com/autoencoders-for-the-compression-of-stock-market-data-28e8c1a2da3e)
* [Beginner's Guide to LSTMs and RNNs](https://skymind.ai/wiki/lstm) from Skymind
* [Quantifying Time-Series Synchrony](https://towardsdatascience.com/four-ways-to-quantify-synchrony-between-time-series-data-b99136c4a9c9) - using Pearson correlation, Time-Lagged Cross-Correlation (TLCC), Dynamic Time Warping....
* [Complete Guide to Time Series Forecasting](https://towardsdatascience.com/the-complete-guide-to-time-series-analysis-and-forecasting-70d476bfe775)
* [Anomaly Detection with Prometheus](http://events19.linuxfoundation.org/wp-content/uploads/2017/12/AIOps-Anomaly-Detection-with-Prometheus-Marcel-Hild-Red-Hat.pdf)
* [Intro to Isolation Forests](https://ruivieira.github.io/introduction-to-isolation-forests.html)


Other:
* [Swarm Intelligence](https://appliednetsci.springeropen.com/articles/10.1007/s41109-020-00260-8)

### Python/Pandas

* [Vaex](https://github.com/vaexio/vaex) - "out of core" Pandas for big data, using memory mapping, zero-copy, volume visualization
* [PySpark vs Dask vs Vaex etc](https://towardsdatascience.com/beyond-pandas-spark-dask-vaex-and-other-big-data-technologies-battling-head-to-head-a453a1f8cc13) - interesting comparison of diff frameworks for big data analysis via Pandas API.

Kedro is a good framework for standardizing processing pipelines.

* [PyOD](https://github.com/yzhao062/Pyod#implemented-algorithms) - outlier detection library
* [ADTs in Python](http://blog.ezyang.com/2020/10/idiomatic-algebraic-data-types-in-python-with-dataclasses-and-union/)

* [Oh no, my data science is getting Rusty!](https://www.crowdstrike.com/blog/data-science-test-drive-of-rust-programming-language/) - neat post from CrowdStrike on integrating Rust with Python for improved performance AND safety

### Data Engineering

* [dvc](https://dvc.org/doc/use-cases/versioning-data-and-model-files/tutorial) is a library and CLI for git-like versioning of datasets, models, etc. - but can leverage cloud storage like S3
* [Pachyderm](https://www.pachyderm.com/getting-started/) is an entire platform for versioning and DS workflow - like DVC on steroids
* [FBLearner Flow](https://engineering.fb.com/2016/05/09/core-data/introducing-fblearner-flow-facebook-s-ai-backbone/) - Facebook's ML experimentation and workflow platform.  They have "operators" which can parallelize work.

* [kube-batch](https://github.com/kubernetes-sigs/kube-batch) - advanced batch job scheduler for Kubernetes, multi-tenant

## Interesting Datasets, Public Data

* [Best free, open data sources](https://www.freecodecamp.org/news/https-medium-freecodecamp-org-best-free-open-data-sources-anyone-can-use-a65b514b0f2d/)
* [Our World in Data / COVID](https://ourworldindata.org/coronavirus) - Really neat site with stats tracking COVID cases, you can custom select countries to compare etc.
* [Global COVID Index](https://covid19.pemandu.org/) - comparative map showing different COVID measurements globally

## Telemetry, Time Series, Tracing

* [Box of Pain](http://pmg.csail.mit.edu/papers/vr-revisited.pdf) - injection of faults and delays together with tracing for evolved insights
* [Chaos Mesh](https://github.com/chaos-mesh/chaos-mesh) - Cloud native (ie Kubernetes-integrated) chaos engineering/injection system!
* [Hastic](https://hastic.io) - Anomaly detection plugin for Grafana/TSDBs
* [Static Code Analysis for Log Parsing](https://medium.com/palantir/using-static-code-analysis-to-improve-log-parsing-18f0d1843965) - turning unstructured to structured logs
* [Canopy](https://research.fb.com/wp-content/uploads/2017/10/sosp17-final14.pdf?) - Facebook's End to End Tracing and Analysis System

Scalyr has a bunch of cool blog posts about how they do fast log/event searching:
* [How Scalyr Works](https://www.scalyr.com/help/how-scalyr-works) talks about log pre-aggregation using a 60 second buffer, and
* [Searching 1.5TB/Sec](https://www.scalyr.com/blog/searching-1tb-sec-systems-engineering-before-algorithms/) - using brute force to search huge amounts of data

## Compression

* [TurboTranspose](https://github.com/powturbo/Turbo-Transpose) - Transpose: SIMD Integer+Floating Point Compression Filter.  With lots of links to floating point compression algorithms.

## I/O and Performance

* [ScyllaDB and I/O Access Methods](https://www.scylladb.com/2017/10/05/io-access-methods-scylla/) - discussions of mmap vs AIO/DIO vs standard Linux I/O

## Logging and String Processing

* [Smart String Processing Algos in Clickhouse](https://geeks-world.github.io/articles/466183/index.html) - def worth a read for string/substr search
    - Somebody's Java experiment on above https://gist.github.com/jexp/825280
* [FM-Index](https://en.wikipedia.org/wiki/FM-index), a neat structure that allows for fast exact string indexing and counting while compressing original string data at the same time.  There is a Rust [crate](https://crates.io/crates/fm-index)
* [Beating Textbook Algorithms in String Search](https://medium.com/wix-engineering/beating-textbook-algorithms-in-string-search-5d24b2f1bbd0) - great discussion of Knuth-Morris-Pratt, Aho-Corasick, and other basic string search algorithms

* [IOx](https://github.com/influxdata/influxdb_iox) - New in-memory columnar InfluxDB engine using Arrow, DataFusion, rust!  Persists using parquet.  Super awesome stuff.

* [MinSQL](https://github.com/minio/minsql/blob/master/README.md) - interesting POC on lightweight SQL based log search, w automatic field parsing etc.
* [Tremor](https://docs.tremor.rs) - a simple event processing / log and metric processing and forwarding system, with scripting and streaming query support.  Much more capable than Telegraf.
* [Graph coloring for Machine Learning](https://sisu.ai/blog/graph-coloring-for-machine-learning) - column reduction using approximate coloring techniques

## Data Justice

https://journals.sagepub.com/doi/10.1177/2053951717736335

