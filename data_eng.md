<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Data Engineering, Databases, Data Structures, ML/DS](#data-engineering-databases-data-structures-mlds)
  - [Indexing, Pagecache, Storage Engines](#indexing-pagecache-storage-engines)
  - [Data Processing Systems](#data-processing-systems)
  - [Distributed Systems General](#distributed-systems-general)
  - [Data Structures](#data-structures)
  - [OLAP, Aggregation](#olap-aggregation)
  - [ML and Data Science](#ml-and-data-science)
  - [Telemetry, Time Series, Tracing](#telemetry-time-series-tracing)
  - [Logging](#logging)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Data Engineering, Databases, Data Structures, ML/DS

## Indexing, Pagecache, Storage Engines

* [Adaptive Radix Trees](http://www-db.in.tum.de/~leis/papers/ART.pdf) - cache friendly indexing for in-memory databases
* [HAT-Trie](https://tessil.github.io//2017/06/22/hat-trie.html) - a cache concious trie
* [Bw-Tree](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/bw-tree-icde2013-final.pdf) and [LLAMA](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/llama-vldb2013.pdf) - a new latch-free B-Tree design from Microsoft using delta-update / log-structured techniques and a hybrid latch-free page cache for high write throughput.  Really interesting set of papers for DB storage engine. 

* [The Case for Learned Index Structure](https://ai.google/research/pubs/pub46518) - interesting paper from Google on using DL/ML/AI to create more efficient indexes
* [Lucene: The Good Parts](https://blog.parse.ly/post/1691/lucene/) - a great introduction to Lucene, terminology, indexing technology, search vs aggregations, etc.
* [Hyperscan](https://www.hyperscan.io) - Intel's high performance multiple regex matching library

## Data Processing Systems

* [Timely Dataflow](https://github.com/TimelyDataflow/timely-dataflow) - distributed data-parallel compute engine in Rust, based on the NAIAD paper

## Distributed Systems General

* [Viewstamped Replication](http://pmg.csail.mit.edu/papers/vr-revisited.pdf) - classic paper by Barbara Liskov

## Data Structures

* [Counting Quotient Filters](https://blog.acolyer.org/2017/08/08/a-general-purpose-counting-filter-making-every-bit-count/) - much faster at updating and search than Bloom filters, and can count too!  An [implementation in C](https://github.com/vedantk/quotient-filter) exists.
* [Moment-based Quantile Sketches](http://www.bailis.org/papers/moments-vldb2018.pdf) - a paper out of Stanford offering highly efficient alternative to T-Digests for quantile sketches.  Also [repo](https://github.com/stanford-futuredata/momentsketch)
* [DDSketch](https://blog.acolyer.org/2019/09/06/ddsketch/) - "a fast and fully-mergeable quantile sketch with relative-error guarantees"

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

Time Series ML

* [LSTM Neural Networks for Anomaly Detection](https://medium.com/datadriveninvestor/lstm-neural-networks-for-anomaly-detection-4328cb9b6e27) - really relevant to time series analysis
* [Machine Learning for Predictive Maintenance](https://medium.com/bigdatarepublic/machine-learning-for-predictive-maintenance-where-to-start-5f3b7586acfb)
* [Autoencoders for Stock-Market Time Series Compression](https://towardsdatascience.com/autoencoders-for-the-compression-of-stock-market-data-28e8c1a2da3e)
* [Beginner's Guide to LSTMs and RNNs](https://skymind.ai/wiki/lstm) from Skymind

## Telemetry, Time Series, Tracing

* [Box of Pain](http://pmg.csail.mit.edu/papers/vr-revisited.pdf) - injection of faults and delays together with tracing for evolved insights
* [Hastic](https://hastic.io) - Anomaly detection plugin for Grafana/TSDBs

## Logging

* [MinSQL](https://github.com/minio/minsql/blob/master/README.md) - interesting POC on lightweight SQL based log search, w automatic field parsing etc.
