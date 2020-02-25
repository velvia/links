<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Some links on Rust](#some-links-on-rust)
- [IDE/Editor/Utilities](#ideeditorutilities)
- [Cool Rust Projects](#cool-rust-projects)
- [Cool Data Structures](#cool-data-structures)
- [Rust Error Handling](#rust-error-handling)
- [Rust Concurrency](#rust-concurrency)
  - [Shared Data Across Multiple Threads](#shared-data-across-multiple-threads)
- [Rust Data Processing](#rust-data-processing)
- [Rust and Scala/Java](#rust-and-scalajava)
  - [Rust-Java Integration / Rust FFI](#rust-java-integration--rust-ffi)
- [Testing and CI/CD](#testing-and-cicd)
  - [Cross-compilation](#cross-compilation)
- [Performance and Low-Level Stuff](#performance-and-low-level-stuff)
  - [Perf profiling:](#perf-profiling)
  - [Fast String Parsing](#fast-string-parsing)
  - [Bitpacking, Binary Structures, Serialization](#bitpacking-binary-structures-serialization)
  - [SIMD](#simd)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Some links on Rust

[cheats.rs](https://cheats.rs) - Awesome quick ref.

* [The Rust Book](https://doc.rust-lang.org/book/2018-edition/ch00-00-introduction.html) - probably the best starting point
* [Rustlings](https://github.com/rust-lang/rustlings/blob/master/README.md) - small exercises to learn
* [Rust By Example](http://rustbyexample.com/) - also the guide on their site is pretty good.
* [Rustlang in a Nutshell](https://www.softax.pl/blog/rust-lang-in-a-nutshell-1-introduction/) - great introduction
* [Rust: A Unique Perspective](https://limpet.net/mbrubeck/2019/02/07/rust-a-unique-perspective.html) - comprehensive summary about Rust ownership from angle of unique access, covers RC/Arc etc.
* [Rust Borrowing and Ownership](http://squidarth.com/rc/rust/2018/05/31/rust-borrowing-and-ownership.html) - easy-to-read, short summary of basic ownership, borrowing, and lifetime references
* [Understanding Rust Lifetimes](https://medium.com/nearprotocol/understanding-rust-lifetimes-e813bcd405fa)
* [Learn Rust with Too Many Linked Lists](https://rust-unofficial.github.io/too-many-lists/) - hilarious.
* [The Evolution of Rust Programmers](http://antoyo.ml/evolution-rust-programmer) - hilarious look at different coding styles
* [Fireflowers: Rust in the words of its Practitioners](https://brson.github.io/fireflowers/) - just brilliant commentary on what Rust is.
* [Rust and the Three Laws of Informatics](https://blog.usejournal.com/rust-and-the-three-laws-of-informatics-4324062b322b) - great detailed guide to how Rust allows developers to uncompromisingly achieve correctness, maintainability, AND efficiency
* [Prefer Rust over C/C++](http://cliffle.com/blog/prefer-rust/) - when to and when not to prefer Rust
* [Moving from C to Rust](https://www.flocknetworks.com/moving-from-c-to-rust/)
  - [C2Rust and Quake](https://immunant.com/blog/2020/01/quake3/) - a tool to auto translate C to Rust!
* [On Rusts Module System](https://gist.github.com/DanielKeep/470f4e114d28cd0c8d43) - good explanation of paths, naming, modules -- see this when compiler complains about cannot find symbols

[Speed without wizardry](http://fitzgeraldnick.com/2018/02/26/speed-without-wizardry.html) - how using Rust is safer and better than using hacks in Javascript

Dealing with strings are confusing in rust, because there are two types: a heap-
allocated `String` and a pointer to a slice of String bytes: `&str`.  Knowing
what to use, and defining structures on them, immediately exposes the steep
learning curve of ownership.

See the [Guide to Strings](http://doc.rust-lang.org/guide-strings.html) for some help.

Online resources and help:
* The Rust [Discord #beginners](https://discordapp.com/channels/442252698964721669/448238009733742612) channel has been pretty helpful for me
* [Rust IRC channel](http://client00.chat.mibbit.com/?server=irc.mozilla.org&channel=%23rust)
* [Rust for Rubyists](http://www.rustforrubyists.com/)
* [Rust Playpen](http://play.rust-lang.org/) - closest thing to a REPL  :(
* [makepad](http://makepad.nl) - Web-based Rust + WebASM multimedia playground

Specific topics:
* [Rust conversion reference](http://carols10cents.github.io/rust-conversion-reference/)
* [Async Rust](https://thomashartmann.dev/blog/async-rust/) - A really concise and great intro to async/await
* [Elegant library APIs in Rust](https://deterministic.space/elegant-apis-in-rust.html) - lots of good tips here
* [Effectively using Iterators in Rust](https://hermanradtke.com/2015/06/22/effectively-using-iterators-in-rust.html) - on differences between `iter()`, `into_iter()`, types, etc.
* [Rust-san](https://github.com/japaric/rust-san/blob/master/README.md) - sanitizers for Rust code, if the basic compiler checks are not enough  :)
* [Colorized Rust backtraces](https://github.com/athre0z/color-backtrace). :)
* [Rust Macros case studies](https://github.com/dtolnay/case-studies/blob/master/README.md)
* [Overview of Macros in Rust](https://words.steveklabnik.com/an-overview-of-macros-in-rust) - from Steve Klabnik
* [Rust TypeState Pattern](http://cliffle.com/blog/rust-typestate/)

## IDE/Editor/Utilities

* [RustAnalyzer](https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/README.md) - LSP-based plugin/server for IDE functionality in Sublime/VSCode/EMacs/etc
* [Cargo-play](https://crates.io/crates/cargo-play) - run Rust scripts without needing to set up a project

## Cool Rust Projects

* [XSV](https://github.com/BurntSushi/xsv) - a fast CSV parsing and analysis tool
* [Ripgrep](https://github.com/BurntSushi/ripgrep) - insanely fast grep utility, great for code searches.  Shows off power of Rust regex library
* [Bat](https://github.com/sharkdp/bat) - A super `cat` with syntax highlighting, git integration, other features
* [Sled](https://github.com/spacejam/sled) - an embedded database engine using latch-free Bw-tree on latch-free page cache techniques for speed
* [MinSQL](https://github.com/minio/minsql/blob/master/README.md) - interesting POC on lightweight SQL based log search, w automatic field parsing etc.
* [TabNine](https://tabnine.com) - an ML-based autocompleter, written in Rust
* [async-std](https://async.rs/blog/announcing-async-std/) - the standard library with async APIs
* [Nushell](http://www.jonathanturner.org/2019/08/introducing-nushell.html) - Rust shell that turns all output into tabular data.  Pretty cool!
* [Timely Dataflow](https://github.com/TimelyDataflow/timely-dataflow) - distributed data-parallel compute engine in Rust!!!
* [imagecli](https://github.com/theotherphil/imagecli/blob/master/README.md) - CLI for image batch processing
* [Toshi](https://github.com/toshi-search/Toshi) - ElasticSearch written in Rust using [Tantivy](https://github.com/tantivy-search/tantivy) as the engine

## Cool Data Structures

* [hashbrown](https://crates.io/crates/hashbrown) - This crate is a Rust port of Google's high-performance SwissTable hash map, about 8x faster than built in hash map, with lower memory footprint
* [radix-trie](https://crates.io/crates/radix_trie)
* [Patricia Tree](https://crates.io/crates/patricia_tree) - Radix-tree based map for more compact storage
* Using [Finite State Automata and Rust](https://blog.burntsushi.net/transducers/) to quickly index and find data amongst HUGE amount of strings

* [Easy Persistent Data Structures in Rust](https://medium.com/swlh/easy-persistent-data-structures-in-rust-b58334aeaf0a) - replacing `Box` with `Rc`

## Rust Error Handling

* [Anyhow](https://docs.rs/anyhow/1.0.26/anyhow/) - streamlined error handling with context....

## Rust Concurrency

* [Benefits of Async/Await](https://docs.rs/dtolnay/0.0.3/dtolnay/macro._01__await_a_minute.html)
* [Tracing with Tokio and Rust](https://tokio.rs/blog/2019-08-tracing/)
* [Async stacktraces](http://fitzgeraldnick.com/2019/08/27/async-stacks-in-rust.html) - this is SUPER COOL!!!
* [Rust Parallelism for non C/C++ Devs](https://medium.com/nearprotocol/rust-parallelism-for-non-c-c-developers-ec23f48b7e56) - great resource on the low-level primitives like `Mutex` and `RwLock`
* [Coping with Mutable State in Multiple Threads](https://medium.com/@KevinHoffman/coping-with-mutable-state-in-multiple-threads-with-rust-9059c83b6c01)
* [Fearless Concurrency with Hazard Pointers](http://ticki.github.io/blog/fearless-concurrency-with-hazard-pointers/) - using the `conc` crate and `Atomic` which implements hazard pointers for fine-grained and safe protection of readers and garbage

* [Bastion](https://bastion.rs) - Erlang/Akka-style, remote supervised actor framework     

### Shared Data Across Multiple Threads

Sometimes one needs to share a large data structure across threads and several of them must access it.

The most general way to share a data structure is to use `Arc<RwLock<...>>` or `Arc<Mutex<...>>`.  The `Arc` keeps track of lifetimes and lets different threads exist for different lengths of time, and is inexpensive since it is usually only accessed once at thread spawn.  The `Mutex` or `RwLock` lets different threads mutate it safely, assuming the data structure is not thread-safe.

A thread-safe data structure could be used in place of the `RwLock` or `Mutex`.

[Scoped threads](https://docs.rs/crossbeam/0.7.2/crossbeam/thread/index.html) could be used if only one owner will mutate the data structure, and one wants to share immutable refs with other threads for reading.  However, the special threads in Crossbeam crate are still needed as Rustc by itself has no way of proving the lifetime of a thread or when it will be joined, thus any immutable refs created from the owner thread still cannot compile or be shared due to rustc lifetime checks.  Scoped threads are a way around that as it gives rustc a guarantee that the threads will be joined before the owner goes away.

[Arc-swap](https://github.com/vorner/arc-swap) could potentially help too.

## Rust Data Processing

* [Are we learning yet?](http://www.arewelearningyet.com) - list of ML Rust crates
* [Timely Dataflow](https://github.com/TimelyDataflow/timely-dataflow) - distributed data-parallel compute engine in Rust!!!
* [DataFusion](https://arrow.apache.org/blog/2019/02/04/datafusion-donation/) - a Rust query engine which is part of Apache Arrow!
* [Weld](https://github.com/weld-project/weld) - Stanford's high-performance runtime for data analytics
* [Toshi](https://github.com/toshi-search/Toshi) - ElasticSearch written in Rust using [Tantivy](https://github.com/tantivy-search/tantivy) as the engine
* [MeiliDB](https://github.com/meilisearch/MeiliDB/blob/master/README.md) - fast full-text search engine
* [Vector](https://github.com/timberio/vector) - unified client side collection agent for logs, metrics, events
* [simdjson-rs](https://github.com/simd-lite/simdjson-rs) - SIMD-enabled JSON parser
 
## Rust and Scala/Java

[Rust for Java Developers](https://github.com/andyrbell/rust-for-java-developers)

* The presence of true unsigned types is really nice for low-level work.  I hit a bug in Scala where I used >> instead of >>>.  In Rust you declare a type as unsigned and don't have to worry about this.
* Immutable byte slices and reference types again are awesome for low-level work.
* Trait monomorphisation is awesome for ensuring trait methods can be inlined.  JVM cannot do this when there is more than one implementation of a trait.
* Being able to examine assembly directly from compiler output is super nice for low level perf work (compared to examining bytecode and not knowing the final output until runtime)

* OTOH, rustc is definitely much much stricter (IMO) compared to scalac.  Much of this is for good reason though, for example lack of integer/primitive coercion, ownership, etc. gives safety guarantees.

### Rust-Java Integration / Rust FFI

* [Calling Rust from Java](http://stackoverflow.com/questions/30258427/calling-rust-from-java) - especially see the hint for using jnr-ffi
* There is also [j4rs](https://astonbitecode.github.io/blog/post/j4rs_0.6.0/) for calling Java from Rust
* [Exposing a Rust library to C](https://www.greyblake.com/blog/2017-08-10-exposing-rust-library-to-c/) - has some great tips on creating .so's and working with strings
* It seems to me Circle CI's support for multiple docker images and explicit manifest style makes it very easy to set up multiple language and dependency support
* [Supporting multiple languages in Travis CI](https://stackoverflow.com/questions/27644586/how-to-set-up-travis-ci-with-multiple-languages)
* [Running LLVM on GraalVM](https://www.graalvm.org/docs/reference-manual/languages/llvm/) - using GraalVM to embed and run LLVM bitcode!  Too bad GraalVM is commercial/Oracle only
 
## Testing and CI/CD

The two standard property testing crates are [Quickcheck](https://crates.io/crates/quickcheck) and [proptest](https://github.com/AltSysrq/proptest).  Personally I prefer proptest due to much better control over input generation (without having to define your own type class).

### Cross-compilation

A common concern - how do I build different versions of my Rust lib/app for say OSX and also Linux?  
- I would start with [Cross compilation to OSX with Rust](http://alwayscoding.ca/momentos/2016/05/08/cross-compilation-to-osx-with-rust/) which uses the OSXCross project along with some Cargo config.  This is for building for OSX from a Linux (say CircleCI or Travis) build container.
- On OSX, not too hard to use a Linux build VM to do it
- For automation, maybe better to create a single Docker image which combines [crossbuild](https://hub.docker.com/r/multiarch/crossbuild/dockerfile) (which has a recipe for OSXCross + other targets) with a rustup container like [abronan/rust-circleci](https://hub.docker.com/r/abronan/rust-circleci) which allows building both nightly and stable.  Use Docker [multi-stage builds](https://stackoverflow.com/questions/39626579/is-there-a-way-to-combine-docker-images-into-1-container) to make combining multiple images easier

Finally, the [Taking Rust everywhere with Rustup](https://blog.rust-lang.org/2016/05/13/rustup.html) blog has good guide on how to use rustup to install cross toolchains, but the above steps to install OS specific linkers are still important.

## Performance and Low-Level Stuff

A big part of the appeal of Rust for me is super fast, SAFE, built in UTF8 string processing, access to detailed memory layout, things like SIMD.  Basically, to be able to idiomatically, safely, and beautifully (functionally?) do super fast and efficient data processing.

* [Optimizing String Processing in Rust](http://lise-henry.github.io/articles/optimising_strings.html) - really useful stuff
* [Achieving warp speed with Rust](http://troubles.md/posts/rust-optimization/#keep-as-much-as-possible-in-registers) - great tips on performance optimization
* [Representations](https://doc.rust-lang.org/reference/type-layout.html#representations) - super important to understand low-level memory layouts for structs.  C vs packed vs ....  including alignment issues.
* Precise memory layouts and [how to dump out Rust struct memory layouts](https://stackoverflow.com/questions/26271151/precise-memory-layout-control-in-rust)
    - Or just use the [memoffset](https://crates.io/crates/memoffset) crate
* Rust uses jemalloc by default for apps and system malloc for libraries. How to [switch the default allocator](https://github.com/rust-lang/jemalloc).
    - Or use the [jemallocator](https://crates.io/crates/jemallocator) and [jemalloc-ctl](https://crates.io/crates/jemalloc-ctl) crates for stats, deep dives, etc.
    - Also see [MiMalloc](https://crates.io/crates/mimalloc) - a high perf allocator from Microsoft
    - There are even [epoch GCs](https://crates.io/crates/crossbeam-epoch) available
    - Also look into the arena and [typed_arena](https://crates.io/crates/typed-arena) crates... very cheap allocations within a region, then free entire region at once.
* [High Performance Rust](https://www.packtpub.com/application-development/rust-high-performance) - a book

NOTE: simplest way to increase perf may be to enable certain CPU instructions: `set -x RUSTFLAGS "-C target-feature=+sse3,+sse4.2,+lzcnt,+avx,+avx2"`

### Perf profiling:

* [cargo-flamegraph](https://github.com/ferrous-systems/cargo-flamegraph) -- this is now the easiest way to get a FlameGraph on OSX and profile your Rust binaries.  To make it work with bench:
    - First run `cargo bench` to build your bench executable
    - If you haven't already, `cargo install flamegraph` (recommend at least v0.1.13)
    - `sudo flamegraph target/release/bench-aba573ea464f3f67` (replace bench-aba* with the name of your bench executable)
    - `open -a Safari flamegraph.svg`
* [Rust Profiling with DTrace and FlameGraphs on OSX](http://carol-nichols.com/2017/04/20/rust-profiling-with-dtrace-on-osx/) - probably the best bet (besides Instruments), can handle any native executable too
    - From `@blaagh`: though the predicate should be `"/pid == $target/"` rather than using execname.
    - [DTrace Guide](http://dtrace.org/guide/chp-profile.html) is probably pretty useful here
* [Tools for Profiling Rust](http://athemathmo.github.io/2016/09/14/tools-for-profiling-rust.html) - cpuprofiler might possibly work on OSX.  It does compile.  The cpuprofiler crate requires surrounding blocks of your code though.
* [Rust Performance Profiling on Travis CI](https://beachape.com/blog/2016/11/02/rust-performance-testing-on-travis-ci/)
* [Rust Profiling talk](https://speakerdeck.com/stevej/improving-rust-performance-through-profiling-and-benchmarking?slide=81) - discusses both OSX and Linux, as well as Instruments and [Intel VTune](https://software.intel.com/en-us/vtune/choose-download)
* [Flamer](https://github.com/llogiq/flamer) - an alternative to generating FlameGraphs if one is willing to instrument code.  Warning: might require nightly Rust features.
* [Rust Profiling with Instruments on OSX](http://carol-nichols.com/2015/12/09/rust-profiling-on-osx-cpu-time/) - but apparently cannot export CSV to FlameGraph :(
* [cargo-profiler](https://github.com/kernelmachine/cargo-profiler) - only works in Linux :(

* [coz](https://github.com/plasma-umass/coz) and its Cargo plugin, [coz-rs](https://github.com/alexcrichton/coz-rs)  -- "a new kind of profiler that unlocks optimization opportunities missed by traditional profilers. Coz employs a novel technique we call causal profiling that measures optimization potential"

[cargo-asm](https://github.com/gnzlbg/cargo-asm) can dump out assembly or LLVM/IR output from a particular method.  I have found this useful for really low level perf analysis.  NOTE: if the method is generic, you need to give a "monomorphised" or filled out method.  Also, methods declared inline won't show up.

What I've found that works (but see cargo flamegraph above for easier way):
```sh
sudo dtrace -c './target/release/bench-2022f41cf9c87baf --profile-time 120' -o out.stacks -n 'profile-997 /pid == $target/ { @[ustack(100)] = count(); }'
~/src/github/FlameGraph/stackcollapse.pl out.stacks | ~/src/github/FlameGraph/flamegraph.pl >rust-bench.svg
open -a Safari rust-bench.svg
```

where -c bench.... is the executable output of cargo bench.

I was hoping [cargo-with](https://github.com/cbourjau/cargo-with) would allow us to run above dtrace command with the name of the bench output, but alas it doesn't seem to work with bench.  (NOTE: they are working on a PR to fix this! :)

NOTE: The built in `cargo bench` requires nightly Rust, it doesn't work on stable!  I highly recommend for benchmarking to use [criterion](https://github.com/bheisler/criterion.rs), which works on stable and has extra features such as gnuplot, parameterized benchmarking and run-to-run comparisons, as well as being able to run for longer time to work with profiling such as dtrace.

### Fast String Parsing

* [nom](https://docs.rs/nom/4.1.1/nom/) - a direct parser using macros, commonly accepted as fastest generic parser
* [pest](https://pest.rs/#editor) is a PEG parser using an external, easy to understand syntax file. Not quite as fast but might be easier to understand and debug.  There is also a [book](https://pest.rs/book/intro.html).
* [combine](https://github.com/Marwes/combine) is a parser combinator library, supposedly just as fast as nom, syntax seems slightly easier

### Bitpacking, Binary Structures, Serialization

* [bitpacking](https://crates.io/crates/bitpacking) - insanely fast integer bitpacking library
* [packed_struct](https://crates.io/crates/packed_struct) - bitfield packing/unpacking; can also pack arrays of bitfields; mixed endianness, etc.

The ideal performance-wise is to not need serialization at all; ie be able to read directly from portions of a binary byte slice.  There are some libraries for doing this, such as flatbuffers, or [flatdata](https://heremaps.github.io/flatdata/) for which there is a Rust crate; or Cap'n Proto.  However, there may be times when you want more control or things like Cap'n Proto are not good enough.

How do we perform low-level byte/bit twiddling and precise memory access?  Unfortunately, all structs in Rust basically need to have known sizes. There's something called [dynamically sized types](https://doc.rust-lang.org/nomicon/exotic-sizes.html) basically like slices where you can have the last element of a struct be an array of unknown size; however, they are virtually impossible to create and work with, and this only covers some cases anyhow.  So we will unfortunately need a combination of techniques.  In order of preference:
* I have found [plain](https://github.com/randomites/plain) works really well.  Mark your structs with `#[repr(C)]`.  It only helps with size and alignment, not endianness - so maybe more for in-memory structures or when you are sure you don't need code to work across endianness platforms.  If your structures are not aligned then use `#[repr(C, packed)]` or `#[align(1)]`.
* Use a crate such as [bytes](https://crates.io/crates/bytes) or [scroll](https://crates.io/crates/scroll) to help extract and write structs and primitives to/from buffers. Might need extra copying though. Also see [iobuf](https://crates.io/crates/iobuf)
* [rel-ptr](https://crates.io/crates/rel-ptr) - small library for relative pointers/offsets, should be super useful for custom file formats and binary/persistent data structures
* [arrayref](https://docs.rs/arrayref/0.3.5/arrayref/) might help extract fixed size arrays from longer ones.
* [bytemuck](https://docs.rs/bytemuck/1.1.0/bytemuck/) for casts
* [bitmatch](https://crates.io/crates/bitmatch) could be great for bitfield parsing
* Or use the [pod](http://arcnmx.github.io/nue/pod/index.html) crate to help with some of the above conversions. However pod seems to no longer be maintained. [nue](http://arcnmx.github.io/nue/nue/index.html) and its macros can also help with struct alignment.
  - Also see [zero](https://docs.rs/zero/0.1.2/zero/)
* Allocate a `Vec::<u8>` and [transmute](https://stackoverflow.com/questions/25917260/getting-raw-bytes-from-packed-struct) specific portions to/from structs of known size, or convert pointers within regions back to references:
```rust
    let foobar: *mut Foobar = mybytes[..].as_ptr() as *mut Foobar;
    let &mut Foobar = (unsafe { foobar.as_ref() }).expect("Cannot convert foobar to ref");
```
* Or [structview](https://crates.io/crates/structview) which offers types for unaligned integers etc.
* There are some DST crates worth checking out: [slice-dst](https://crates.io/crates/slice-dst), [thin-dst](https://crates.io/crates/thin-dst)
* As a last resort, work with [raw pointer](https://doc.rust-lang.org/std/primitive.pointer.html) math using the add/sub/offset methods, but this is REALLY UNSAFE.
```rust
    let foobar: *mut Foobar = mybytes[..].as_ptr() as *mut Foobar;
    unsafe {
      (*foobar).foo = 17;
      (*foobar).bar = -1;
    }
```

Also check out the crazy number of crates available under [compression](https://crates.io/search?q=compression&sort=recent-downloads) - including various interesting radix and trie data structures, and more compression algorithms that one has never heard of.

### SIMD

There is this great article on [Towards fearless SIMD](https://raphlinus.github.io/rust/simd/2018/10/19/fearless-simd.html), about why SIMD is hard, and how to make it easier.   Along with pointers to many interesting crates doing SIMD.  (There is a built in crate, `std::simd` but it is really lacking) (However, [packed_simd](https://crates.io/crates/packed_simd) will soon be merged into it)

Another great article: [learning simd with rust by finding planets](https://medium.com/@razican/learning-simd-with-rust-by-finding-planets-b85ccfb724c3) is great too. simd is really about parallelism.  it is better to do multiple operations in a parallel (vertical) fashion, vector on vector, than to do horizontal operations where the different components of a wide register depend on one another.

* [faster](https://github.com/AdamNiederer/faster) - "SIMD for Humans" -- probably my favorite one, very high level translation of numeric map loops into SIMD
* [fearless_simd](https://github.com/raphlinus/fearless_simd), the blog post author's crate.  Runtime CPU detection and use of the most optimal code, no need for unsafe, but only focused on f32.
* [SIMDeez](https://github.com/jackmott/simdeez) - abstracts intrinsic SIMD instructions over different instruction sets & vector widths, runtime detection
* [simd_aligned](https://crates.io/crates/simd_aligned) and [simd_aligned_rust](https://github.com/ralfbiedert/simd_aligned_rust) - work with SIMD and packed_simd using vectors which have guaranteed alignment
