<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Some links on Rust](#some-links-on-rust)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Some links on Rust

Dealing with strings are confusing in Rust, because there are two types: a heap-
allocated `String` and a pointer to a slice of String bytes: `&str`.  Knowing
what to use, and defining structures on them, immediately exposes the steep
learning curve of ownership.

See the [Guide to Strings](http://doc.rust-lang.org/guide-strings.html) for some help.

* [The Rust Book](https://doc.rust-lang.org/book/2018-edition/ch00-00-introduction.html) - probably the best starting point

* [Rust IRC channel](http://client00.chat.mibbit.com/?server=irc.mozilla.org&channel=%23rust)
* [Rust for Rubyists](http://www.rustforrubyists.com/)
* [Rust Playpen](http://play.rust-lang.org/) - closest thing to a REPL  :(
* [On Rusts Module System](https://gist.github.com/DanielKeep/470f4e114d28cd0c8d43) - good explanation of paths, naming, modules -- see this when compiler complains about cannot find symbols
* [Rust By Example](http://rustbyexample.com/) - also the guide on their site is pretty good.
* [Columnarization in Rust](http://www.frankmcsherry.org/columnarization/serialization/rust/2014/12/15/Columnarization-in-Rust.html)
* [Rust conversion reference](http://carols10cents.github.io/rust-conversion-reference/)

Cool Rust Projects
* [XSV](https://github.com/BurntSushi/xsv) - a fast CSV parsing and analysis tool
* [Ripgrep](https://github.com/BurntSushi/ripgrep) - insanely fast grep utility, great for code searches.  Shows off power of Rust regex library
* [Sled](https://github.com/spacejam/sled) - an embedded database engine using latch-free Bw-tree on latch-free page cache techniques for speed

Rust-Java Integration / Rust FFI
* [Calling Rust from Java](http://stackoverflow.com/questions/30258427/calling-rust-from-java) - especially see the hint for using jnr-ffi
* [Exposing a Rust library to C](https://www.greyblake.com/blog/2017-08-10-exposing-rust-library-to-c/) - has some great tips on creating .so's and working with strings
* [Running LLVM on GraalVM](https://www.graalvm.org/docs/reference-manual/languages/llvm/) - using JDK11/GraalVM to embed and run LLVM bitcode!!

[Speed without wizardry](http://fitzgeraldnick.com/2018/02/26/speed-without-wizardry.html) - how using Rust is safer and better than using hacks in Javascript

### Cool Data Structures

* [hashbrown](https://crates.io/crates/hashbrown) - This crate is a Rust port of Google's high-performance SwissTable hash map, about 8x faster than built in hash map, with lower memory footprint

### Performance and Low-Level Stuff

A big part of the appeal of Rust for me is super fast, SAFE, built in UTF8 string processing, access to detailed memory layout, things like SIMD.  Basically, to be able to idiomatically, safely, and beautifully (functionally?) do super fast and efficient data processing.

* [Optimizing String Processing in Rust](http://lise-henry.github.io/articles/optimising_strings.html) - really useful stuff
* [Representations](https://doc.rust-lang.org/reference/type-layout.html#representations) - super important to understand low-level memory layouts for structs.  C vs packed vs ....  including alignment issues.
* Precise memory layouts and [how to dump out Rust struct memory layouts](https://stackoverflow.com/questions/26271151/precise-memory-layout-control-in-rust)
* Rust uses jemalloc by default for apps and system malloc for libraries. How to [switch the default allocator](https://github.com/rust-lang/jemalloc).
    - Or use the [jemallocator](https://crates.io/crates/jemallocator) and [jemalloc-ctl](https://crates.io/crates/jemalloc-ctl) crates for stats, deep dives, etc.
    - There are even [epoch GCs](https://crates.io/crates/crossbeam-epoch) available
    - Also look into the arena and [typed_arena](https://crates.io/crates/typed-arena) crates... very cheap allocations within a region, then free entire region at once.
* [High Performance Rust](https://www.packtpub.com/application-development/rust-high-performance) - a book

#### Bitpacking and Data Processing

* [bitpacking](https://crates.io/crates/bitpacking) - insanely fast integer bitpacking library

Also check out the crazy number of crates available under [compression](https://crates.io/search?q=compression&sort=recent-downloads) - including various interesting radix and trie data structures, and more compression algorithms that one has never heard of.

#### SIMD

There is this great article on [Towards fearless SIMD](https://raphlinus.github.io/rust/simd/2018/10/19/fearless-simd.html), about why SIMD is hard, and how to make it easier.   Along with pointers to many interesting crates doing SIMD.  (There is a built in crate, `std::simd` but it is really lacking) (However, [packed_simd](https://crates.io/crates/packed_simd) will soon be merged into it)

Another great article: [learning simd with rust by finding planets](https://medium.com/@razican/learning-simd-with-rust-by-finding-planets-b85ccfb724c3) is great too. simd is really about parallelism.  it is better to do multiple operations in a parallel (vertical) fashion, vector on vector, than to do horizontal operations where the different components of a wide register depend on one another.

* [faster](https://github.com/AdamNiederer/faster) - "SIMD for Humans" -- probably my favorite one, very high level translation of numeric map loops into SIMD
* [fearless_simd](https://github.com/raphlinus/fearless_simd), the blog post author's crate.  Runtime CPU detection and use of the most optimal code, no need for unsafe, but only focused on f32.
* [SIMDeez](https://github.com/jackmott/simdeez) - abstracts intrinsic SIMD instructions over different instruction sets & vector widths, runtime detection
* [simd_aligned](https://crates.io/crates/simd_aligned) - 
