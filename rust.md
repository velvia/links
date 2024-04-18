<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Getting Started with Rust](#getting-started-with-rust)
- [Some links on Rust](#some-links-on-rust)
- [Borrowing and Lifetime Tricks](#borrowing-and-lifetime-tricks)
- [Macros](#macros)
- [Cool Rust Projects](#cool-rust-projects)
- [Rust Error Handling](#rust-error-handling)
- [Rust Concurrency](#rust-concurrency)
  - [Shared Data Across Multiple Threads](#shared-data-across-multiple-threads)
- [Data Processing and Data Structures](#data-processing-and-data-structures)
  - [JSON Processing](#json-processing)
  - [Cool Data Structures](#cool-data-structures)
  - [Geospatial and Graph](#geospatial-and-graph)
  - [String Performance](#string-performance)
- [Rust and Scala/Java](#rust-and-scalajava)
  - [Rust and Python](#rust-and-python)
  - [Rust-OtherLanguage Integration / Rust FFI](#rust-otherlanguage-integration--rust-ffi)
- [CLI and Misc](#cli-and-misc)
- [IDE/Editor/Tooling](#ideeditortooling)
- [Testing and CI/CD](#testing-and-cicd)
  - [Cross-compilation](#cross-compilation)
- [Performance and Low-Level Stuff](#performance-and-low-level-stuff)
  - [Dynamic objects, Box, dyn Any, Trait Objects](#dynamic-objects-box-dyn-any-trait-objects)
  - [Perf profiling:](#perf-profiling)
    - [Memory/Heap Profiling](#memoryheap-profiling)
  - [Fast String Parsing](#fast-string-parsing)
  - [Bitpacking, Binary Structures, Serialization](#bitpacking-binary-structures-serialization)
  - [Enums, Thin Pointers, Type Wrapping](#enums-thin-pointers-type-wrapping)
  - [SIMD](#simd)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Getting Started with Rust

[Why the developers who use Rust love it so much](https://stackoverflow.blog/2020/06/05/why-the-developers-who-use-rust-love-it-so-much/) - from StackOverflow survey, really good quotes

If you want a Rust REPL, check out [evcxr](https://github.com/google/evcxr/tree/master/evcxr_repl).

I highly recommend [rust-analyzer](https://rust-analyzer.github.io) to support fast compile checks, references, refactorings, etc. in your editor.
VSCode works pretty well - install rust-analyzer and the "Even Better TOML" extension and you should be set.

* [The Rust Book](https://doc.rust-lang.org/book/2018-edition/ch00-00-introduction.html) - probably the best starting point
* [Rustlings](https://github.com/rust-lang/rustlings/blob/master/README.md) - small exercises to learn
* [Easy Rust Youtube Channel](https://www.youtube.com/watch?v=-lYeJeQ11OI&list=PLfllocyHVgsRwLkTAhG0E-2QxCf-ozBkk) - great videos
* [Rust By Example](http://rustbyexample.com/) - also the guide on their site is pretty good.
* [Complete(sh) Rust Cheat Sheet](https://katib.moe/the-completesh-rust-cheat-sheet?source=personalized-newsletter&source-id=2023-05-25)
* [explaine.rs](https://jrvidal.github.io/explaine.rs/) - paste Rust code into the window and hover over keywords to get explanations. Great for learning.
* [Rustlang in a Nutshell](https://www.softax.pl/blog/rust-lang-in-a-nutshell-1-introduction/) - great introduction
* [Mental models for learning Rust](https://kerkour.com/rust-mental-models) - really really short blurb on how to approach learning Rust
* [Rust Borrowing and Ownership](http://squidarth.com/rc/rust/2018/05/31/rust-borrowing-and-ownership.html) - easy-to-read, short summary of basic ownership, borrowing, and lifetime references
* [A Java Programmer Understanding Rust Ownership](https://medium.com/@rotc21/rust-adventures-a-java-programmer-understanding-rust-ownership-edbeb6b8001)
* [Rust Error Handling for Pythonistas](https://theomn.com/rust-error-handling-for-pythonistas/)
* [Zero to Production in Rust](https://www.zero2prod.com)

Easy short intros:
* [A Rust Gem: The Rust Map API](https://www.thecodedmessage.com/posts/rust-map-entry/) - comparing C++, Java, and Rust Map APIs and why Option and not having nulls makes the Rust Map API superior

Online resources and help:
* [cheats.rs](https://cheats.rs) - Awesome quick ref.
* The Rust [Discord #beginners](https://discordapp.com/channels/442252698964721669/448238009733742612) channel has been pretty helpful for me
* [Rust IRC channel](http://client00.chat.mibbit.com/?server=irc.mozilla.org&channel=%23rust)
* [Rust for Rubyists](http://www.rustforrubyists.com/)
* [Rust Playpen](http://play.rust-lang.org/) - closest thing to a REPL  :(
* [makepad](http://makepad.nl) - Web-based Rust + WebASM multimedia playground
* [Awesome Rust Mentors](https://rustbeginners.github.io/awesome-rust-mentors/)

## Some links on Rust

* [Cheat sheet for Iterator methods](https://danielkeep.github.io/itercheat_baked.html)

* [Rust Design Patterns](https://rust-unofficial.github.io/patterns/intro.html) - super helpful resource
* [What you Can't Do in Rust and What To Do Instead](https://blog.logrocket.com/what-you-cant-do-in-rust-and-what-to-do-instead/) - great guide for anti-patterns
* [Rust: A Unique Perspective](https://limpet.net/mbrubeck/2019/02/07/rust-a-unique-perspective.html) - comprehensive summary about Rust ownership from angle of unique access, covers RC/Arc etc.
* [Rust is for Professionals](https://gregoryszorc.com/blog/2021/04/13/rust-is-for-professionals/) - great perspective on what makes Rust unique and so appealing
* [Tour of Rust's Standard Library Traits](https://github.com/pretzelhammer/rust-blog/blob/master/posts/tour-of-rusts-standard-library-traits.md) - really great detailed guide with an explanation about traits, generics, associated types, etc.
* [Understanding Rust Lifetimes](https://medium.com/nearprotocol/understanding-rust-lifetimes-e813bcd405fa)
  - [Common Rust Lifetime Misconceptions](https://github.com/pretzelhammer/rust-blog/blob/master/posts/common-rust-lifetime-misconceptions.md) -- a great detailed dive into nuances
* [Learn Rust with Too Many Linked Lists](https://rust-unofficial.github.io/too-many-lists/) - hilarious.
* [Learning Rust](https://quinedot.github.io/rust-learning/index.html) - a very detailed treatise on borrowing, ownership, `dyn Trait` and trait objects
* [In Rust, Ordinary Vectors are Values](https://smallcultfollowing.com/babysteps/blog/2018/02/01/in-rust-ordinary-vectors-are-values/) - about why persistent collections are not quite as useful in Rust, because Rust already prevents shared mutation
* [Shared Mutability in Rust: Acyclic Graphs](https://andrewjpritchard.medium.com/shared-mutability-in-rust-3f92155ddbf7) - really good article on mutable child entities, and how to share things which need to be mutable (hint: don't, instead use an "arena" pattern where a single owner mutates things)
* [Jon Gjengset on Rust Lifetime Annotations](https://www.youtube.com/watch?v=rAl-9HwD858#action=share) - actually check out his Youtube channel, lots of great tutorials

* [The Evolution of Rust Programmers](http://antoyo.ml/evolution-rust-programmer) - hilarious look at different coding styles
* [Fireflowers: Rust in the words of its Practitioners](https://brson.github.io/fireflowers/) - just brilliant commentary on what Rust is.
* [Oxidizing the Interview](https://blog.mgattozzi.dev/oxidizing-the-technical-interview/) - hilarious read on a Rust technical interview
* [Rust and the Three Laws of Informatics](https://blog.usejournal.com/rust-and-the-three-laws-of-informatics-4324062b322b) - great detailed guide to how Rust allows developers to uncompromisingly achieve correctness, maintainability, AND efficiency
* [Why Scientists are turning to Rust](https://www.nature.com/articles/d41586-020-03382-2) - from Nature mag
* [Rust After the Honeymoon](http://dtrace.org/blogs/bmc/2020/10/11/rust-after-the-honeymoon/) - by Bryan Cantrill, a list of top favorite Rust tricks/properties.  Did you know that `{:#x?}` will pretty-print structs in HEX??
* [Prefer Rust over C/C++](http://cliffle.com/blog/prefer-rust/) - when to and when not to prefer Rust
* [Moving from C to Rust](https://www.flocknetworks.com/moving-from-c-to-rust/)
  - [C2Rust and Quake](https://immunant.com/blog/2020/01/quake3/) - a tool to auto translate C to Rust!
* [Clear Explanation of Rust's Module System](http://www.sheshbabu.com/posts/rust-module-system/) - easy intro guide
* [On Rusts Module System](https://gist.github.com/DanielKeep/470f4e114d28cd0c8d43) - good explanation of paths, naming, modules -- see this when compiler complains about cannot find symbols
* [Null The Billion Dollar Mistake and how Rust Provides a Solution](https://piyushagarwal.hashnode.dev/null-the-billion-dollar-mistake-and-how-rust-provides-a-solution?source=personalized-newsletter&source-id=2023-07-27)

[Speed without wizardry](http://fitzgeraldnick.com/2018/02/26/speed-without-wizardry.html) - how using Rust is safer and better than using hacks in Javascript

Dealing with strings are confusing in rust, because there are two types: a heap-
allocated `String` and a pointer to a slice of String bytes: `&str`.  Knowing
what to use, and defining structures on them, immediately exposes the steep
learning curve of ownership.

See the [Guide to Strings](http://doc.rust-lang.org/guide-strings.html) for some help.

Specific topics:
* [Rust conversion reference](http://carols10cents.github.io/rust-conversion-reference/)
* [Default Values for Maintainability](https://cj.rs//blog/rust-default-values-for-maintainability/) - short and easy guide
* [Async Rust](https://thomashartmann.dev/blog/async-rust/) - A really concise and great intro to async/await
* [Async Rust: Futures, Tasks, Wakers; Oh My!](https://msarmi9.github.io/posts/async-rust/) - another great concise intro, starting with basic async concepts/syntax and diving into details about Wakers and the Future mechanism
* [Rust Async is Colored](https://morestina.net/blog/1686/rust-async-is-colored) - great deep dive into async vs sync, connecting the two worlds, and implications
* [Shared/Exclusive Refs, not Mutable/Immutable](https://docs.rs/dtolnay/latest/dtolnay/macro._02__reference_types.html) - excellent explanation from @dtolnay on thinking about `&mut T` as exclusive, not immutable.  Also explaining interior mutability and `RefCell` etc. - and why they allow `&self` safely while providing mutation.
* [Elegant library APIs in Rust](https://deterministic.space/elegant-apis-in-rust.html) - lots of good tips here
* [Rain's Rust CLI Guide](https://rust-cli-recommendations.sunshowers.io) - how to write and organize Rust CLI apps
* [Effectively using Iterators in Rust](https://hermanradtke.com/2015/06/22/effectively-using-iterators-in-rust.html) - on differences between `iter()`, `into_iter()`, types, etc.
* [Generics and Associated Types](https://blog.thomasheartman.com/posts/on-generics-and-associated-types) - when to use each one
* [Returning Iterators](https://depth-first.com/articles/2020/06/22/returning-rust-iterators/) - really helpful article, this is not easy
  - [Recursive Iterators in Rust](https://fasterthanli.me/articles/recursive-iterators-rust) - yelch, using Box
  - [Internal-iterator](https://docs.rs/internal-iterator/0.1.1/internal_iterator/) - a potentially better solution for easily implementing some iterators
  - [propane](https://github.com/withoutboats/propane) - Creating iterators via generator/yield API
* [Generic Return Types in Rust](https://blog.jcoglan.com/2019/04/22/generic-returns-in-rust/) - deep dive into `Iterator.collect()`, traits, and Rust's type system
* [Rust-san](https://github.com/japaric/rust-san/blob/master/README.md) - sanitizers for Rust code, if the basic compiler checks are not enough  :)
* [Colorized Rust backtraces](https://github.com/athre0z/color-backtrace). :)
* [Rust TypeState Pattern](http://cliffle.com/blog/rust-typestate/)
* [Pretty State Machines in Rust](https://hoverbear.org/blog/rust-state-machine-pattern/) - great article on diff state machine patterns, use of enums and structs
* [Init Struct Pattern](https://xaeroxe.github.io/init-struct-pattern/) - on patterns for initializing structs
* [Rc and RefCell tricks](http://i.hsfzxjy.site/2019-06-23-rc-refcell-pattern/) - good explanations of the two
* [COW, Rust vs C++](https://oribenshir.github.io/afternoon_rusting/blog/copy-on-write) - great dive into details of copy-on-write. Might be a great pattern for working with things like strings, where cloning might be expensive.
* [Magical Zero-Sized Types and Proofs](https://www.hardmo.de/article/2021-03-14-zst-proof-types.md) - for type masochists
* [Structural Typing in Rust](https://beachape.com/blog/2021/05/25/structural-typing-in-rust/) - HLists, ability to use path-based and shape/signature based trait typing instead of by name
* [How Rust Solved Dependency Hell](https://stephencoakley.com/2019/04/24/how-rust-solved-dependency-hell) - neat look at what's underneath Cargo to help solve dep issues.  Rustc can handle multiple versions of a dependency.

* [Cacao: Building macOS/iOS Apps in Rust](https://rymc.io/blog/2021/cacao-rs-macos-ios-rust/)

## Borrowing and Lifetime Tricks

If you need to borrow multiple items mutably from a Vec/array/SmallVec/etc.:
* The [thread](https://stackoverflow.com/questions/30073684/how-to-get-mutable-references-to-two-array-elements-at-the-same-time) on solutions
* You can use [split_at_mut()](https://docs.rs/smallvec/1.10.0/smallvec/struct.SmallVec.html#method.split_at_mut) but this is clumsy
* [Arref](https://docs.rs/arref/latest/arref/) gives a great solution
* There is a nightly [get_many_mut()](https://doc.rust-lang.org/core/primitive.slice.html#method.get_many_mut) API

If you have a Trait with an associated type that must deal with lifetimes:
https://stackoverflow.com/questions/33734640/how-do-i-specify-lifetime-parameters-in-an-associated-type

## Macros

I started writing Rust macros and it is not only lots of fun, but pretty essential for writing concise, performant code IMO.  Writing Rust has lots of boilerplate sometimes, especially owing to not having real inheritance.  I recommend starting with `macro_rules!` which are fancy templates and really easy.  Here are some links to help:

* [Macros in Rust - a Tutorial](https://blog.logrocket.com/macros-in-rust-a-tutorial-with-examples/) - really easy tutorial, esp for `macro_rules!`
* [Macros - a Methodical Introduction](https://danielkeep.github.io/tlborm/book/mbe-README.html) - very detailed book mostly about `macro_rules!` with explanations for the minutae of parsing
  * [macro_rules](https://danielkeep.github.io/tlborm/book/mbe-macro-rules.html)
* [How to Write Hygienic Rust Macros](https://gist.github.com/Kestrer/8c05ebd4e0e9347eb05f265dfb7252e1) - important and short.  Read this to ensure your macros work everywhere - so users don't have to worry about imports, etc.
* [Rust Macros case studies](https://github.com/dtolnay/case-studies/blob/master/README.md)
* [Overview of Macros in Rust](https://words.steveklabnik.com/an-overview-of-macros-in-rust) - from Steve Klabnik

Some crates that may help write macros:
* [spez](https://crates.io/crates/spez) - match and specialize on the type of an expression.  "A trick to do specialization in non-generic contexts on stable Rust"
* [concat-ident](https://crates.io/crates/concat-idents) - macro to concat multiple identifiers etc. and use the result, perhaps as a struct or method name. Very useful in macros


## Cool Rust Projects

NOTE: there's a separate section for Data-related projects.

CLI tools:
* [XSV](https://github.com/BurntSushi/xsv) - a fast CSV parsing and analysis tool
* [zoxide](https://github.com/ajeetdsouza/zoxide) - a supercharged, AI-based replacement for cd with rank-based search of your most frequently used dirs
  - [mcfly](https://github.com/cantino/mcfly) - Upgraded, smarter Ctrl-R for bash etc.  (note: fish users already have this built in, basically)
* [Ripgrep](https://github.com/BurntSushi/ripgrep) - insanely fast grep utility, great for code searches.  Shows off power of Rust regex library
* [Bat](https://github.com/sharkdp/bat) - A super `cat` with syntax highlighting, git integration, other features
* [Bottom](https://github.com/ClementTsang/bottom) - Cross-platform fancy `top` in Rust - process/sys mon with graphs, very useful!
* [eza](https://github.com/eza-community/eza) - a better `ls` with tree view, git info and color-coding (ps exa is not maintained anymore)
* [procs](https://github.com/dalance/procs?ref=itsfoss.com) - a better `ps`
* [gitui](https://github.com/Extrawurst/gitui) - awesome, fast Git terminal UI.  It will change your life!
* [skim](https://github.com/lotabout/skim) - `sk` is a general purpose fuzzy-finder; it can work with ripgrep and other utils too
* [zellij](https://zellij.dev) - terminal mux/session detach like tmux/screen, but with a pretty UI and plugins
* [pueue](https://github.com/Nukesor/pueue) - instead of using tmux, queue and manage your background tasks
* [xh](https://github.com/ducaale/xh) - HTTPie clone / much better `curl` alternative
* [Dust](https://github.com/bootandy/dust) - Rust graphical-text faster and friendlier version of du
* [Diskonaut](https://github.com/imsnif/diskonaut) - another Text-UI folder/file space usage and browsing tool
* [fd](https://github.com/sharkdp/fd) - Rust CLI, friendlier and faster replacement for `find`
* [rustscan](https://github.com/RustScan/RustScan) - Really fast port scanner, this should easily replace lsof / netstat
* [sd](https://github.com/chmln/sd) - Easier to use sed.  You can search and replace in like all files under subdir with `sd old_str new_str **`.
* [Nushell](http://www.jonathanturner.org/2019/08/introducing-nushell.html) - Rust shell that turns all output into tabular data.  Pretty cool!
* [delta](https://github.com/dandavison/delta) - git-delta: colorful git diff viewer
* [ruplacer](https://github.com/dmerejkowsky/ruplacer) - Source code search and replace tool
* [imagecli](https://github.com/theotherphil/imagecli/blob/master/README.md) - CLI for image batch processing
* [Hyperfine](https://github.com/sharkdp/hyperfine/blob/master/README.md) - Rust performance benchmarking CLI
* [Alacritty](https://github.com/alacritty/alacritty/blob/master/README.md) - GPU accelerated terminal emulator
* [jql](https://crates.io/crates/jql/2.5.0) - Rust version of popular `jq` JSON CLI processor, though not as powerful
* [rq](https://github.com/dflemstr/rq) - a Record Query/Transform tool, translate CSV, Avro, CBOR, Json etc etc to and from each other
* [htmlq](https://github.com/mgdm/htmlq) - like jq but for HTML
* [Starship](https://starship.rs) - "The minimal, blazing-fast, and infinitely customizable prompt for any shell!"
* [Kubesql](https://github.com/Dentrax/kubesql) - SQL queries for Kube metadata!
* [grex](https://github.com/pemistahl/grex) - CLI tool to create regexes given a set of strings to match!
* [Scaphandre](https://github.com/hubblo-org/scaphandre) - Metrics agent for collecting power consumption metrics!
* [kdash](https://github.com/kdash-rs/kdash) - Text UI Kubernetes dashboard
* [Josh](https://github.com/josh-project/josh) - Cool git proxy allows you to treat part of a large monorepo like its own smaller git repo!

Wasm:
* [Wasmer](https://medium.com/wasmer/wasmer-1-0-3f86ca18c043) - general purpose WASM runtime
* [Krustlet](https://deislabs.io/posts/introducing-krustlet/) - WebAssembly (instead of containers) runtime on Kubernetes!!  Use Rust + wasm + WASI for a truly portable k8s-based deploy!
* [Extism](https://extism.org/blog/announcing-extism/) - a universal WASM-based plugin system, multi language, but written in Rust
* [lunatic](https://github.com/lunatic-solutions/lunatic) - Erlang-like server side WASM runtime with supervision and channel-based message passing, plus hot reloading!
* [CosmWasm](https://docs.cosmwasm.com/docs/1.0/) - Rust/WASM for programming smart contract on Cosmos ecosystem

Others:
* [TabNine](https://tabnine.com) - an ML-based autocompleter, written in Rust
* [kiro](https://github.com/rhysd/kiro-editor) - a CLI text editor with syntax highlighting, like a friendlier vim
* [ox](https://github.com/curlpipe/ox) - another CLI/Text UI lightweight text editor
* [async-std](https://async.rs/blog/announcing-async-std/) - the standard library with async APIs
* [Convey](https://github.com/bparli/convey) - Layer 4 load balancer
* [Ockam](https://github.com/ockam-network/ockam) - End to end secure messaging lib/platform between cloud and IoT devices
* [Parsec](https://github.com/parallaxsecond/parsec) - abstraction layer for hardware security and cryptography
* [Gazebo](https://crates.io/crates/gazebo) - useful utilties for all apps, by the Facebook Rust team.  They also have blog posts such as on [Dupe](https://developers.facebook.com/blog/post/2021/07/06/rust-nibbles-gazebo-dupe/)

Do Rust in [Turkish](https://github.com/ekimb/pas), [Spanish](https://github.com/UltiRequiem/rustico) and other languages!  :)

Languages etc.
* [BLisp](https://ytakano.github.io/blisp/) - a statically-typed Lisp built on top of Rust
* [RustPython](https://github.com/RustPython/RustPython)

## Rust Error Handling

[Error handling survey](https://blog.yoshuawuyts.com/error-handling-survey/) - really good summary of the Rust error library landscape as of late 2019.

* [Anyhow](https://docs.rs/anyhow/1.0.26/anyhow/) - streamlined error handling with context....
* [Snafu](https://docs.rs/snafu/0.4.1/snafu/index.html) - adding context to errors
* [Error-stack](https://crates.io/crates/error-stack) - I _really_ like the philosophy behind this crate.  It makes it easy to "stack" errors - you get not a backtrace, but stacked detailed errors, with the inner error showing through.

## Rust Concurrency

* [Rust Concurrency: Five Easy Pieces](https://medium.com/@polyglot_factotum/rust-concurrency-five-easy-pieces-871f1c62906a) - a great intro to threads, using message queues, determinism, and more
* [A practical guide to Async in Rust](https://blog.logrocket.com/a-practical-guide-to-async-in-rust/)
* [Benefits of Async/Await](https://docs.rs/dtolnay/0.0.3/dtolnay/macro._01__await_a_minute.html)
* [Tracing with Tokio and Rust](https://tokio.rs/blog/2019-08-tracing/)
* [Async stacktraces](http://fitzgeraldnick.com/2019/08/27/async-stacks-in-rust.html) - this is SUPER COOL!!!
* [tokio-console](https://github.com/tokio-rs/console) - remote async debugging facility!
* [Rust Parallelism for non C/C++ Devs](https://medium.com/nearprotocol/rust-parallelism-for-non-c-c-developers-ec23f48b7e56) - great resource on the low-level primitives like `Mutex` and `RwLock`
* [Coping with Mutable State in Multiple Threads](https://medium.com/@KevinHoffman/coping-with-mutable-state-in-multiple-threads-with-rust-9059c83b6c01)
* [Fearless Concurrency with Hazard Pointers](http://ticki.github.io/blog/fearless-concurrency-with-hazard-pointers/) - using the `conc` crate and `Atomic` which implements hazard pointers for fine-grained and safe protection of readers and garbage

* [Bastion](https://bastion.rs) - Erlang/Akka-style, remote supervised actor framework
* [Kompact](https://github.com/kompics/kompact) - Kompics style message-passing "component system" with actor model and networking built in
* [Actyx](https://github.com/Actyx/Actyx) - really cool "decentralized event database, streaming and processing engine" based on event sourcing concepts, built by one of Akka's founders
* [Actors with Tokio](https://ryhl.io/blog/actors-with-tokio/) - not using any Actor framework, just channels
* Use [mio](https://crates.io/crates/mio) if you want a lower-level event loop, or [thin_main_loop](https://crates.io/crates/thin_main_loop)

### Shared Data Across Multiple Threads

Sometimes one needs to share a large data structure across threads and several of them must access it.

The most general way to share a data structure is to use `Arc<RwLock<...>>` or `Arc<Mutex<...>>`.  The `Arc` keeps track of lifetimes and lets different threads exist for different lengths of time, and is inexpensive since it is usually only accessed once at thread spawn.  The `Mutex` or `RwLock` lets different threads mutate it safely, assuming the data structure is not thread-safe.

A thread-safe data structure could be used in place of the `RwLock` or `Mutex`.

[Scoped threads](https://docs.rs/crossbeam/0.7.2/crossbeam/thread/index.html) could be used if only one owner will mutate the data structure, and one wants to share immutable refs with other threads for reading.  However, the special threads in Crossbeam crate are still needed as Rustc by itself has no way of proving the lifetime of a thread or when it will be joined, thus any immutable refs created from the owner thread still cannot compile or be shared due to rustc lifetime checks.  Scoped threads are a way around that as it gives rustc a guarantee that the threads will be joined before the owner goes away.

[Arc-swap](https://github.com/vorner/arc-swap) is an alternative to Arc that is designed for occasional updates - enables atomic swapping of the object underneath the Arc, and allows one to read without contention (unlike Mutex/RwLock).

Also see [beef](https://github.com/maciejhirsz/beef/) - a leaner version of Cow.

## Data Processing and Data Structures

* [Are we learning yet?](http://www.arewelearningyet.com) - list of ML Rust crates
  - [Linfa](https://github.com/rust-ml/linfa) - Rust ML framework
* [Timely Dataflow](https://github.com/TimelyDataflow/timely-dataflow) - distributed data-parallel compute engine in Rust!!!
* [Hydroflow](https://github.com/hydro-project/hydroflow) - a brand new Rust based optimized streaming dataflow engine, relational data, based on very advanced UCBerkeley research on optimization.
* [DataFusion](https://arrow.apache.org/blog/2019/02/04/datafusion-donation/) - a Rust query engine which is part of Apache Arrow!
  - NOTE: there is now a Ballista project that is basically like Spark - distributed Data Fusion.
* [Amadeus](https://github.com/constellation-rs/amadeus) - distributed streams / Parquet / big data processing
* [Fluvio](https://www.fluvio.io/docs/) - distributed, persistent queuing / stream processing framework using WASM for programmability, written in Rust!
* [Arroyo](https://github.com/ArroyoSystems/arroyo) - another stream processing framework, streaming SQL and Rust pipelines!
* [Weld](https://github.com/weld-project/weld) - Stanford's high-performance runtime for data analytics
* [Cleora](https://www.linkedin.com/pulse/how-we-handle-billion-scale-graph-data-you-can-too-jacek-dąbrowski) - Super fast Rust tool for billion-scale hypergraph vector embedding ML
* [Node crunch](https://github.com/willi-kappler/node_crunch) - simple lightweight distributed compute framework
* [Project Midas](https://github.com/ray33ee/Project-Midas) - distributed compute framework and terminal UI using Lua as scripting language
* [Cube Store](https://cube.dev/blog/introducing-cubestore/) - Rust and Arrow/DataFusion-based rollup/aggregation/cache layer for SQL datastores, too bad it's mostly for JS
* [Noria](https://github.com/mit-pdos/noria) - "data-flow for high-performance web apps" - basically a materialized view cache that updates in real time as database data updates
* [polars](https://github.com/pola-rs/polars) - super fast and high level DataFrame implementation for both Rust and Python, much faster and higher level than using Arrow itself
* [Bagua](https://github.com/BaguaSys/bagua) - distributed learning/training framework, the very fast communication core is written in Rust
* [Similari](https://crates.io/crates/similari) - similarity search/computation engine for ML in Rust

* [Toshi](https://github.com/toshi-search/Toshi) - ElasticSearch written in Rust using [Tantivy](https://github.com/tantivy-search/tantivy) as the engine
* [MeiliDB](https://github.com/meilisearch/MeiliDB/blob/master/README.md) - fast full-text search engine
* [Quickwit](https://github.com/quickwit-oss/quickwit) - Log search DB, like Elastic but built on top of Tantivy
* [Datafuse](https://github.com/datafuselabs/datafuse) - distributed "Real-Time Data Processing & Analytics DBMS", similar to Clickhouse "but faster"
* [sonic](https://github.com/valeriansaliou/sonic) - Fast, very lightweight and schemaless search/text index.  NOT a document store, but an index store.
* [Sanakirja](https://pijul.org/posts/2021-02-06-rethinking-sanakirja/) - a transactional KV DB engine/local store, claims to be fastest around
* [Sled](https://github.com/spacejam/sled) - an embedded database engine using latch-free Bw-tree on latch-free page cache techniques for speed
* [Skytable](https://github.com/skytable/skytable) - Rust "realtime NoSQL" key-value database
* [IOx](https://github.com/influxdata/influxdb_iox) - New in-memory columnar InfluxDB engine using Arrow, DataFusion, rust!  Persists using parquet.  Super awesome stuff.
* [IndraDB](https://github.com/indradb/indradb) - Graph database/library written in Rust! and inspired by Facebook's TAO.
* [TerminusDB-store](https://github.com/terminusdb/terminusdb-store) - a Rust RDF triple data store
* [BonsaiDB](https://bonsaidb.io) - NoSQL document store written in Rust with Rust schemas

* [Vector](https://github.com/vectordotdev/vector) - high performance observability data pipeline, for transforming, aggregating, routing logs, metrics, traces, etc.
  - includes a [Vector Remap Language](https://vector.dev/docs/reference/vrl/) for general transformation
* [Tremor](https://docs.tremor.rs) - a simple event processing / log and metric processing and forwarding system, with scripting and streaming query support.  Much more capable than Telegraf.
* [MinSQL](https://github.com/minio/minsql/blob/master/README.md) - interesting POC on lightweight SQL based log search, w automatic field parsing etc.
* [pq](https://github.com/iximiuz/pq) - Parse and Query log files as time series, extracting structured records out of common log files

* [plotters](https://github.com/plotters-rs/plotters) - Rust data visualization / graphing library
* [Stateright](https://github.com/stateright/stateright) - distributed protocol/model checker with UI, linearizability checker!
* [Clepsydra](https://crates.io/crates/clepsydra) - Graydon Hoare working on distributed database protocol - in Rust!
* [crepe](https://crates.io/crates/crepe) - Datalog, declarative logic programs as macros in Rust

### JSON Processing

For JSON DOM (IR) processing, using the mimalloc allocator provided me a 2x speedup with serde-json.  Then, switching to [json-rust](https://github.com/maciejhirsz/json-rust) provided another 1.8x speedup.  The speedup is completely unreal, much faster than JVM.  The main reason I guess is that json-rust has a `Short` DOM class for short strings, which requires no heap allocation.

* [simdjson-rs](https://github.com/simd-lite/simdjson) - SIMD-enabled JSON parser.  NOTE: no writing of JSON.
* [pjson](https://github.com/tidwall/pjson.rs) - JSON streaming parser
* [streamson](https://github.com/shenek/streamson) - efficient JSON processing for large documents

### Cool Data Structures

* [leapfrog](https://github.com/robclu/leapfrog) - fast, concurrent `HashMap`, lock-free if types support atomic ops.
  - What's neat about its API is that instead of locking at bucket level, and blocking inserts if a reader is taking too long, it never returns references to data and relies on an atomic API
* [concread](https://docs.rs/concread/0.2.14/concread/index.html) - Concurrently Readable (Copy on Write, MVCC) datastructures - "allow multiple readers with transactions to proceed while single writers can operate" - guaranteeing readers same version.  There is a hashmap and ARCache.
* [flashmap](https://docs.rs/flashmap/0.1.0/flashmap/) - lock free, partially wait free, eventually consistent concurrent hash map
* [flurry](https://docs.rs/flurry/0.4.0/flurry/) - Rust impl of Java's ConcurrentHashMap.  Uses seize for ref-count-based GC.
* [im](https://docs.rs/im/latest/im/) - Immutable data structures for Rust
* [rust-phf](https://github.com/rust-phf/rust-phf) - generate efficient lookup tables at compile time using perfect hash functions!
* [odht](https://crates.io/crates/odht) - "hash table that can be mapped from disk into memory without need for up-front decoding" - deterministic binary representation, and platform and endianness independent.  Sounds sweet!
* [radix-trie](https://crates.io/crates/radix_trie)
* [Patricia Tree](https://crates.io/crates/patricia_tree) - Radix-tree based map for more compact storage
* [probabilistic-collections](https://crates.io/crates/probabilistic-collections) - Bloom/Cuckoo/Quotient filters, CountMinSketch, HyperLogLog, streaming approx set membership, etc.
* [priq](https://github.com/bexxmodd/priq) - "blazing fast" priority queue built using arrays
* Using [Finite State Automata and Rust](https://blog.burntsushi.net/transducers/) to quickly index and find data amongst HUGE amount of strings
* [ahash](https://crates.io/crates/ahash) - this seems to be the fastest hash algo for hash keys
* [Metrohash](https://crates.io/crates/metrohash) - a really fast hash algorithm
* [IndexMap](https://docs.rs/indexmap/1.3.2/indexmap/index.html) - O(1) obtain by index, iteration by index order
* [FM-Index](https://en.wikipedia.org/wiki/FM-index), a neat structure that allows for fast exact string indexing and counting while compressing original string data at the same time.  There is a Rust [crate](https://crates.io/crates/fm-index)
* [Heapless](https://docs.rs/heapless/0.5.5/heapless/) - static data structures with fixed size; Vec, heap, map, set, queues

* [dashmap](https://github.com/xacrimon/dashmap) - "Blazing fast concurrent HashMap for Rust". NOTE: I don't recommend this project, I used it in my Ying profiler but it can deadlock in unpredictable ways

* [Easy Persistent Data Structures in Rust](https://medium.com/swlh/easy-persistent-data-structures-in-rust-b58334aeaf0a) - replacing `Box` with `Rc`
* [VecMap](https://contain-rs.github.io/vec-map/vec_map/) - map for small integer keys, may use less space

### Geospatial and Graph

* The base Geometry processing crate is [geo](https://docs.rs/geo/0.18.0/geo/).
  - Geo does not (as of 0.18) handle intersections, difference, XOR etc.  Try [geo-booleanop](https://crates.io/crates/geo-booleanop) for a Rust-only implementation using Martinez-Rueda algorithm
  - Or use [geos](https://github.com/georust/geos) based on the C library
* [spatial-join](https://crates.io/crates/spatial-join) - Spatial joins and proximity maps!
* [Rstar](https://crates.io/crates/rstar) - n-dimensional R*-Tree for geospatial indexing and nearest-neighbor
* [spade](https://crates.io/crates/spade) - R-trees and Delaunay triangulations
* [Hora Search](https://horasearch.com) - Nearest-Neighbor (NN) / geo search library that includes multiple algorithms including HNSW, SSG, PQIVF, etc.

* [Petgraph](https://docs.rs/petgraph/0.5.0/petgraph/) - Graph data structure for Rust, considered perhaps most mature right now

### String Performance

Rust has native UTF8 string processing, which is AWESOME for performance.  However, there are two concerns usually:

1. Small string memory efficiency.  The native `String` type uses at least two words just for pointer and length/cap, which might be longer than the string itself;
2. Minimizing number of heap allocations

Here are some solutions:
* [String](https://docs.rs/string/0.2.1/string/) - string type with configurable byte storage, including stack byte arrays!
* [Inlinable String](http://fitzgen.github.io/inlinable_string/inlinable_string/index.html) - stores strings up to 30 chars inline, automatic promotion to heap string if needed.
* [flexstr](https://github.com/nu11ptr/flexstr) - Enum String type to unify literals, inlined, and heap strings
* [kstring](https://docs.rs/kstring/0.1.0/kstring/) - intended for map keys: immutable, inlined for small keys, and have Ref/Cow types to allow efficient sharing.  :)
* [nested](https://crates.io/crates/nested) - reduce Vec<String> type structures to just two allocations, probably more memory efficient too.
* [tinyset](https://docs.rs/tinyset/0.4.2/tinyset/) - space efficient sets and maps, can be combined with nested perhaps
* [bumpalo](https://docs.rs/bumpalo/3.2.1/bumpalo/collections/index.html) can do really cheap group allocations in a `Bump` and has custom `String` and `Vec` versions.  At least lowers allocation overhead.

Here is a comparison of inline string libraries:

So picking a good base library to use for string processing is not so simple.
We avoid the base String type because that always results in an allocation, and ry clone results in further allocs.

Here are some alternative String libraries:
- smallstr - https://crates.io/crates/smallstr
- flexstr - https://docs.rs/flexstr/latest/flexstr/
- kstring - https://docs.rs/kstring/2.0.0/kstring/
- compact_str - https://crates.io/crates/compact_str
- smol_str - https://crates.io/crates/smol_str
- smartstring - https://crates.io/crates/smartstring

They vary based on API and basically on the below two features:
A. How many bytes can be "inlined" on the stack, in the normal 24 bytes uired for a normal String?  This is one key optimization for small string processing.
* smallstr - 16
* flexstr - 22
* kstring - 15 or 22, depending on max_inline feature
* compact_str - 24*
* smol_str - 22
* smartstirng - 23

B. How expensive is it to clone the heap-based version when the string doesn't  inline on the stack?
*`` smallstr - O(n), similar to regular String allocation
* flexstr - O(1), Arc or Rc (when using LocalStr)
* kstring - O(1) when using Arc (feature), otherwise O(n) Box<str> same as ing
* compact_str - O(n), but heap size grows more slowly (1.5x) compared to mal String
* smol_str - O(1)
* smartstring - O(n)

## Rust and Scala/Java

* [Rust for Java Developers](https://github.com/andyrbell/rust-for-java-developers)
* [5 Rust Reflections from Java](https://aliceevebob.com/2020/05/05/5-rust-reflections-from-java/)

* The presence of true unsigned types is really nice for low-level work.  I hit a bug in Scala where I used >> instead of >>>.  In Rust you declare a type as unsigned and don't have to worry about this.
* Immutable byte slices and reference types again are awesome for low-level work.
* Trait monomorphisation is awesome for ensuring trait methods can be inlined.  JVM cannot do this when there is more than one implementation of a trait.
* Being able to examine assembly directly from compiler output is super nice for low level perf work (compared to examining bytecode and not knowing the final output until runtime)

* OTOH, rustc is definitely much much stricter (IMO) compared to scalac.  Much of this is for good reason though, for example lack of integer/primitive coercion, ownership, etc. gives safety guarantees.

### Rust and Python

* [PyO3](https://github.com/PyO3/pyo3) seems to be a gold standard of Rust-based Python module development.
  - [Maturin](https://github.com/PyO3/maturin) - for building and publishing PyO3-based/Rust Python modules, or mixed Rust/Python projects
  - There are older posts too: [Wrapping Rust Types as Python classes](https://depth-first.com/articles/2020/08/03/wrapping-rust-types-as-python-classes/) and [RustyPy](https://github.com/iduartgomez/rustypy/wiki/Rust-in-Python) but they are much more work than PyO3
* [PyOxidizer](https://pyoxidizer.readthedocs.io/en/stable/) - a Rust tool to package Python apps, interpreter, and all dependencies as a single binary, by wrapping app in a Rust program with a custom Rust Py module importer.  Also helps embed Python code in Rust apps.
* [Oh no, my data science is getting Rusty!](https://www.crowdstrike.com/blog/data-science-test-drive-of-rust-programming-language/) - neat post from CrowdStrike on integrating Rust with Python for improved performance AND safety

### Rust-OtherLanguage Integration / Rust FFI

* [Calling Rust from Java](http://stackoverflow.com/questions/30258427/calling-rust-from-java) - especially see the hint for using jnr-ffi
* There is also [j4rs](https://astonbitecode.github.io/blog/post/j4rs_0.6.0/) for calling Java from Rust
* [SaferFFI](https://www.ditto.live/blog/posts/introducing-safer-ffi) - a neat library to make exposing C-like APIs much safer esp dealing with pointers, nulls, borrowing etc.
* [Exposing a Rust library to C](https://www.greyblake.com/blog/2017-08-10-exposing-rust-library-to-c/) - has some great tips on creating .so's and working with strings
* [cc-rs](https://github.com/alexcrichton/cc-rs) - C/C++ build integration with Cargo
* It seems to me Circle CI's support for multiple docker images and explicit manifest style makes it very easy to set up multiple language and dependency support
* [Supporting multiple languages in Travis CI](https://stackoverflow.com/questions/27644586/how-to-set-up-travis-ci-with-multiple-languages)
* [Running LLVM on GraalVM](https://www.graalvm.org/docs/reference-manual/languages/llvm/) - using GraalVM to embed and run LLVM bitcode!  Too bad GraalVM is commercial/Oracle only

## CLI and Misc

* [Structopt](https://crates.io/crates/structopt) - define CLI options using a struct!
* [tui-rs](https://github.com/fdehau/tui-rs) - Rust terminal UI for CLI apps.  Check out list of projects it refers to also.  Lots of options!
  * [Ratatui](https://ratatui.rs/showcase/widgets/) is the new project btw
* [cursive](https://github.com/gyscos/cursive/tree/main) is another text UI library, based on curses

* [Hot Reloading in Rust](https://robert.kra.hn/posts/hot-reloading-rust/) - great article on how to hot-reload dynamic linked libraries in Rust, and on the potential pitfalls, with plenty of links.

* [inventory](https://github.com/dtolnay/inventory) and [ctor](https://github.com/mmastrac/rust-ctor) - static "plugin" registration of different things in your repo, say you need a static list of function implementations, metadata, etc.
* [quote]() - the standard way to generate a Rust code TokenStream from quoting rust code.  Great for procedural macros or code generation.
* [prettyplease](https://crates.io/crates/prettyplease) - Rust TokenStream pretty printer - great for code generation

## IDE/Editor/Tooling

* [EVCXR](https://github.com/google/evcxr/tree/master/evcxr_repl) - a Rust REPL!!!  With deps, and tab-completion for methods!!
* [comby-rust](https://github.com/huitseeker/comby-rust) - rewrite Rust code using comby
* [rustviz](https://github.com/rustviz/rustviz) - Visualize borrowing and ownership!
* [no-panics-whatsoever](https://crates.io/crates/no-panics-whatsoever) - crate to detect and ensure at compile time there aren't panics in your code
* [cargo-bloat](https://github.com/RazrFalcon/cargo-bloat) - what's taking up space in my Rust binary
* [cargo-limit](https://github.com/alopatindev/cargo-limit) - clean up, sort and limit error/warning output.  Great for those of us running cargo in shells!
* [mutagen](https://github.com/llogiq/mutagen) - mutation testing tool for Rust programs.  Generates "mutations" in your code to try to break test coverage!
* [cargo-rr](https://github.com/danielzfranklin/cargo-rr) - time travel/recording/reverse debugger framework for Rust using rr
  - For more explanation see [Print debugging should go away](https://robert.ocallahan.org/2021/04/print-debugging-should-go-away.html)
* [cargo_hakari](https://docs.rs/cargo-hakari/0.9.4/cargo_hakari/about/index.html) - A crate to speed up builds of workspace-hack packages ... for when you have multiple crates or complex builds, and you have duplicate dependencies
* [inkwell](https://github.com/TheDan64/inkwell) - LLVM API, including LLVM IR generation and running LLVM JIT to run snippets in your code

Dependency conflicts?  Use `cargo tree -i` to lookup reverse dependencies for specific packages (which crates are using which deps). For example, `cargo tree -i arrow:5.0.0-SNAPSHOT`.

* [RustAnalyzer](https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/README.md) - LSP-based plugin/server for IDE functionality in Sublime/VSCode/EMacs/etc
* [Configuring Rustfmt](https://rust-lang.github.io/rustfmt/?version=v1.5.1&search=)
* [Godbolt](https://godbolt.org) - A "compiler explorer", not Rust specific but neat to play with compiler settings and diff targets.
* [Cargo-play](https://crates.io/crates/cargo-play) - run Rust scripts without needing to set up a project
  - Also see [cargo-eval](https://github.com/reitermarkus/cargo-eval) and [runner](https://github.com/stevedonovan/runner) for diff ways of easily running scripts without projects

BTW for Rust 1.51+ you can speed up MacOS builds with this in your Cargo.toml (see the [release notes](https://blog.rust-lang.org/2021/03/25/Rust-1.51.0.html)):
```toml
[profile.dev]
split-debuginfo = "unpacked"
```

## Testing and CI/CD

The two standard property testing crates are [Quickcheck](https://crates.io/crates/quickcheck) and [proptest](https://github.com/AltSysrq/proptest).  Personally I prefer proptest due to much better control over input generation (without having to define your own type class).

* [Rust Continuous Delivery](https://kflansburg.com/posts/rust-continuous-delivery/) - hints on using Docker, caching deps, and automated cloud-based CI/CD workflows for Rust
* [Cargo-nextest](https://nexte.st/index.html) looks like a really good project to help with test organization, test CI, running tests faster, etc.
* [rstest](https://crates.io/crates/rstest) - Fixture based test framework.  Think of being able to inject arguments into a test function.  Setup and teardown can be built into fixtures.
* [Faster Build Times on MacOS](https://dsincl12.medium.com/speed-up-your-rust-compiler-macos-d9fbe0f32dbc)
* [5x Faster Rust Docker Builds with cargo-chef](https://www.lpalmieri.com/posts/fast-rust-docker-builds/) - you need this for faster Rust app deploys!
* [Are We Observable Yet?](https://www.lpalmieri.com/posts/2020-09-27-zero-to-production-4-are-we-observable-yet/#5-12-cleaning-up-instrumentation-code-tracing-instrument) - an introduction to Rust telemetry
* [Miri](https://github.com/rust-lang/miri) - can run binaries and test suites of cargo projects and detect certain classes of undefined behavior, including memory leaks!!

### Cross-compilation

A common concern - how do I build different versions of my Rust lib/app for say OSX and also Linux?
- Easiest way now seems to be to use [cross](https://github.com/rust-embedded/cross) - I tried it and literally as easy as `cargo install cross` and `cross build --target ...` as long as you have Docker.
  + NOTE: crates with non-Rust code (eg jemalloc, mimalloc) often have trouble
- Also see [rust-musl-builder](https://github.com/emk/rust-musl-builder), another Docker-based solution
- musl is the best target for Linux as it removes need for G/LIBC dependencies and versioning.  Musl creates a single static binary for super easy deploys.
- For automation, maybe better to create a single Docker image which combines [crossbuild](https://hub.docker.com/r/multiarch/crossbuild/dockerfile) (which has a recipe for OSXCross + other targets) with a rustup container like [abronan/rust-circleci](https://hub.docker.com/r/abronan/rust-circleci) which allows building both nightly and stable.  Use Docker [multi-stage builds](https://stackoverflow.com/questions/39626579/is-there-a-way-to-combine-docker-images-into-1-container) to make combining multiple images easier

Finally, the [Taking Rust everywhere with Rustup](https://blog.rust-lang.org/2016/05/13/rustup.html) blog has good guide on how to use rustup to install cross toolchains, but the above steps to install OS specific linkers are still important.

## Performance and Low-Level Stuff

A big part of the appeal of Rust for me is super fast, SAFE, built in UTF8 string processing, access to detailed memory layout, things like SIMD.  Basically, to be able to idiomatically, safely, and beautifully (functionally?) do super fast and efficient data processing.

* [Cheap Tricks - Rust Performance](https://deterministic.space/high-performance-rust.html) - set of quick Cargo settings to try
* [How to Write Fast Rust Code](https://likebike.com/posts/How_To_Write_Fast_Rust_Code.html) - really good guide
* [High Performance Rust](https://www.packtpub.com/application-development/rust-high-performance) - a book
* [Optimizing String Processing in Rust](http://lise-henry.github.io/articles/optimising_strings.html) - really useful stuff
* [Achieving warp speed with Rust](http://troubles.md/posts/rust-optimization/#keep-as-much-as-possible-in-registers) - great tips on performance optimization
* [Deep Dive into Dynamic Dispatch](https://medium.com/digitalfrontiers/rust-dynamic-dispatching-deep-dive-236a5896e49b) - great details and perf comparison
* [Rust to Assembly](https://www.eventhelix.com/rust/) - great series of blog posts detailing how various parts of Rust compile down to assembly
* [Modern storage is plenty fast](https://itnext.io/modern-storage-is-plenty-fast-it-is-the-apis-that-are-bad-6a68319fbc1a) - using a new Rust crate called [glommio](https://crates.io/crates/glommio) one can achieve multi-GB per sec read throughputs from modern SSDs.  So maybe we don't need memory after all.
  - Along the same lines, not Rust-specific but [ScyllaDB and I/O Access Methods](https://www.scylladb.com/2017/10/05/io-access-methods-scylla/) - discussions of mmap vs AIO/DIO vs standard Linux I/O
  - [Direct I/O Writes](https://itnext.io/direct-i-o-writes-the-best-way-to-improve-your-credit-score-bd6c19cdfe46) - why doing direct I/O writes may end up better than buffered

* [Representations](https://doc.rust-lang.org/reference/type-layout.html#representations) - super important to understand low-level memory layouts for structs.  C vs packed vs ....  including alignment issues.
* Precise memory layouts and [how to dump out Rust struct memory layouts](https://stackoverflow.com/questions/26271151/precise-memory-layout-control-in-rust)
    - Or just use the [memoffset](https://crates.io/crates/memoffset) crate
* [MemFlow](https://memflow.github.io/#/home) - framework to inspect machine memory.  Think about DMA/IO, debugger, or Plasma-type memory/DB applications.
* Rust uses system malloc by default. How to [switch the default allocator](https://github.com/rust-lang/jemalloc).
    - Use [jemallocator](https://crates.io/crates/jemallocator) and [jemalloc-ctl](https://crates.io/crates/jemalloc-ctl) crates for stats, deep dives, etc.  Jemalloc from Facebook supposed to be fast.
    - Also see [MiMalloc](https://crates.io/crates/mimalloc) - a high perf allocator from Microsoft.  I got 2x improvement for JSON workloads!
    - There are even [epoch GCs](https://crates.io/crates/crossbeam-epoch) available
    - Also look into the arena and [typed_arena](https://crates.io/crates/typed-arena) crates... very cheap allocations within a region, then free entire region at once.
    - Also see [bumpalo](https://github.com/fitzgen/bumpalo) - bump allocator which includes custom versions of standard collections
* Watch out for dynamic dispatch (when you need to use `Box<dyn MyTrait>` etc).  One solution is to use [enum_dispatch](https://docs.rs/enum_dispatch/0.2.1/enum_dispatch/index.html).

If small binary size is what you're after, check out [Min-sized-Rust](https://github.com/johnthagen/min-sized-rust).

Rust nightly now has a super slick [asm!](https://blog.rust-lang.org/inside-rust/2020/06/08/new-inline-asm.html) inline assembly feature.  The way that it integrates Rust variables/expressions with auto register assignment is super awesome.

NOTE: simplest way to increase perf may be to enable certain CPU instructions: `set -x RUSTFLAGS "-C target-feature=+sse3,+sse4.2,+lzcnt,+avx,+avx2"`

NOTE2: `lazy_static` accesses are not cheap.  Don't use it in hot code paths.


### Dynamic objects, Box, dyn Any, Trait Objects

In my experience, if you know all the possible types, using an enum is the fastest, most performant way to store
something dynamic.  No allocations in most cases, good data locality.  enum-dispatch is a big big help for enums.  There
are other solutions like using `dyn Any` but they are all slower and usually involves dynamic dispatch of some kind.
Trait objects also have limitations - mainly around trait safety, so some trait methods are not usable in `dyn`
situations esp Serde traits.  OTOH, nested enums can cause serious memory bloat when you have large enum variants and
they are used in collections.  Here are some "better dyn Any" alternatives:
  - Related: [auto_enum](https://docs.rs/auto_enums/0.7.1/auto_enums/index.html) - a way to return enums when you might need to return `impl A` for some trait A when you might be returning diff implementations
  - Can also use [ambassador](https://crates.io/crates/ambassador) - to delegate trait implementations
  - See [dynamic](https://crates.io/crates/dynamic) for a faster alternative to `dyn Any`.  However in my usage I didn't see a massive improvement.
  - [box_any](https://github.com/uccidibuti/box_any) is another fast solution which actually keeps `*void` style pointers but still drops properly
  - [smallbox](https://crates.io/crates/smallbox) - a box that can store smaller values on stack for speed, also has Clone and PartialEq support.  Questionable Any support though.
  - Also see [unibox](https://crates.io/crates/unibox) - for another solution to storing dynamic data
  - [Mopa](https://github.com/chris-morgan/mopa) - allows you to derive Any-like methods like downcasting for your traits.  Pretty useful.
  - [typetag](https://github.com/dtolnay/typetag) - Serde serializable trait objects

### Perf profiling:

Note: this section is mostly about profiling tools -- detailed breakdowns of bottlenecks, as opposed to benchmarking (which is repeatable, systematic measurement).  The two benchmarking tools I recommend are [criterion](https://github.com/bheisler/criterion.rs) and [Iai](https://github.com/bheisler/iai) for benchmarking.

NEW: I've created a Docker image for [Linux perf profiling](https://github.com/velvia/rust-perf-docker), super easy to use.  The best combo is cargo flamegraph followed by perf and asm analysis.

* [cargo-flamegraph](https://github.com/ferrous-systems/cargo-flamegraph) -- this is now the easiest way to get a FlameGraph on OSX and profile your Rust binaries.  To make it work with bench and Criterion:
    - First run `cargo bench` to build your bench executable
    - If you haven't already, `cargo install flamegraph` (recommend at least v0.1.13)
    - `sudo flamegraph target/release/bench-aba573ea464f3f67 --profile-time 180 <filter> --bench` (replace bench-aba* with the name of your bench executable)
      + The `--profile-time` is needed for flamegraph to collect enough stats
    - `open -a Safari flamegraph.svg`
    - NOTE: you need to turn on `debug = true` in release profile for symbols
    - This method works better for apps than small benchmarks btw, as inlined methods won't show up in the graph.
* [Rust Profiling with Instruments on OSX](http://carol-nichols.com/2015/12/09/rust-profiling-on-osx-cpu-time/) - but apparently cannot export CSV to FlameGraph :(
  - Note that you can now just install [cargo instruments](https://github.com/cmyr/cargo-instruments)
  - Also useful for heap/memory analysis, including tracking retained vs transient allocations
* [Rust Performance: Perf and Flamegraph](https://blog.anp.lol/rust/2016/07/24/profiling-rust-perf-flamegraph/) - including finding hot assembly instructions
* [samply](https://github.com/mstange/samply) - used to be called perfrecord, Rust CPU CLI command profiler using Firefox as UI.  WIP.
* [Iai](https://github.com/bheisler/iai) - a one-shot Rust profiler that uses Valgrind underneath
* [Top-down Microarchitecture Analysis Method](https://easyperf.net/blog/2019/02/09/Top-Down-performance-analysis-methodology) - TMAM is a formal microprocessor perf analysis method from Intel, works with perf to find out what CPU-level bottlenecks are (mem IO? branch predictions? etc.)
* [Rust Profiling with DTrace and FlameGraphs on OSX](http://carol-nichols.com/2017/04/20/rust-profiling-with-dtrace-on-osx/) - probably the best bet (besides Instruments), can handle any native executable too
    - From `@blaagh`: though the predicate should be `"/pid == $target/"` rather than using execname.
    - [DTrace Guide](http://dtrace.org/guide/chp-profile.html) is probably pretty useful here
* [Hyperfine](https://github.com/sharkdp/hyperfine/blob/master/README.md) - Rust performnace benchmarking CLI
* [Tools for Profiling Rust](http://athemathmo.github.io/2016/09/14/tools-for-profiling-rust.html) - cpuprofiler might possibly work on OSX.  It does compile.  The cpuprofiler crate requires surrounding blocks of your code though.
* [Rust Performance Profiling on Travis CI](https://beachape.com/blog/2016/11/02/rust-performance-testing-on-travis-ci/)
* [Rust Profiling talk](https://speakerdeck.com/stevej/improving-rust-performance-through-profiling-and-benchmarking?slide=81) - discusses both OSX and Linux, as well as Instruments and [Intel VTune](https://software.intel.com/en-us/vtune/choose-download)
* [2017 RustConf - Improving Rust Performance through Profiling](https://www.youtube.com/watch?v=hTHp0gjWMLQ)
* [Flamer](https://github.com/llogiq/flamer) - an alternative to generating FlameGraphs if one is willing to instrument code.  Warning: might require nightly Rust features.
* [cargo-profiler](https://github.com/kernelmachine/cargo-profiler) - only works in Linux :(

* [coz](https://github.com/plasma-umass/coz) and its Cargo plugin, [coz-rs](https://github.com/alexcrichton/coz-rs)  -- "a new kind of profiler that unlocks optimization opportunities missed by traditional profilers. Coz employs a novel technique we call causal profiling that measures optimization potential"
* [Rust Perf Book Profiling Page](https://nnethercote.github.io/perf-book/profiling.html) - lots of good links
* [Divan](https://crates.io/crates/divan) - easy macro to benchmark functions

[cargo-asm](https://github.com/gnzlbg/cargo-asm) can dump out assembly or LLVM/IR output from a particular method.  I have found this useful for really low level perf analysis.  NOTE: if the method is generic, you need to give a "monomorphised" or filled out method.  Also, methods declared inline won't show up.
* What I like to do with asm output: check if rustc has inlined certain methods.  Also you can clearly see where dynamic dispatch happens and how complicated generated code seems.  More complicated code usually == slower.
* [llvm-mca](https://www.llvm.org/docs/CommandGuide/llvm-mca.html) - really detailed static analysis and runtime prediction at the machine instruction level
* [Godbolt assembly exploring without crate limitations, in Visual Studio Code](https://saveriomiroddi.github.io/Rust-lulz-godbolt-assembly-exploring-without-crate-limitations-in-visual-studio-code/) - great guide to generating disassembly and visualizing it in VSCode

I have found that `cargo rustc` can often generate more assembly than `cargo asm` where you have to specify a method name.  However, in general one needs to make generic structs concrete, perhaps by adding stub functions in `lib.rs`, in order to view assembly.  Also, LLVM IR might be easier to read.

What works on a Mac (but see cargo flamegraph above for easier way):
```sh
sudo dtrace -c './target/release/bench-2022f41cf9c87baf --profile-time 120' -o out.stacks -n 'profile-997 /pid == $target/ { @[ustack(100)] = count(); }'
~/src/github/FlameGraph/stackcollapse.pl out.stacks | ~/src/github/FlameGraph/flamegraph.pl >rust-bench.svg
open -a Safari rust-bench.svg
```

where -c bench.... is the executable output of cargo bench.

I was hoping [cargo-with](https://github.com/cbourjau/cargo-with) would allow us to run above dtrace command with the name of the bench output, but alas it doesn't seem to work with bench.  (NOTE: they are working on a PR to fix this! :)

I highly recommend for benchmarking to use [criterion](https://github.com/bheisler/criterion.rs), which works on stable and has extra features such as gnuplot, parameterized benchmarking and run-to-run comparisons, as well as being able to run for longer time to work with profiling such as dtrace.

#### Memory/Heap Profiling

The options I've tried out:
* [Bytehound](https://github.com/koute/bytehound) - really slick, but only works on Linux (using perf).
  - No need to modify apps, uses `LD_PRELOAD`
  - extracts full stack traces plus every alloc/dealloc, but claims it uses custom unwinding code that's much much faster
  - tracks memory usage over time, as well as leaks explicitly, and memory fragmentation
  - can give you **flamegraphs** of memory allocations or just leaks!
  - Has a really nice UI/webapp that's bundled together
  - Has many options to write out profiling data to different locations or over network
  - Problems:
    + Creates giant profiling data files.  There are options to slim it down though, such as keeping only allocations that live longer than a particular threshold
    + Bundled viewer does not seem to be able to load debug symbols when profiling data does not include them :(
    + It seems the only way to really include full symbols in the profiling info is to run profiling with a debug build.  However this blows up the size of the data file even more...  hundreds of MBs from just a few minutes of run time!
* jeprof: If you use [jemallocator](https://github.com/tikv/jemallocator) and install jemalloc as your global allocator, you can get some profiling for free.
  - [Jemalloc Heap Profiling](https://github.com/jemalloc/jemalloc/wiki/Use-Case%3A-Heap-Profiling)
  - [How to parse jeprof text output](https://www.igorkromin.net/index.php/2018/06/07/post-processing-jemalloc-jeprof-heap-dump-files-for-statistical-analysis/)
  - Pros: Jemalloc profiling is sampling based and very lightweight.  It can be used in production with minimal perf impact.
  - The profile files are also very small
  - Cons: it's, like, really hard to use.  For example, enabling it via environment variable - the instructions are not very clear, and there is no way to write the files to anything other than the current directory
    + Runtime config: set both environment variables `MALLOC_CONF` and `_RJEM_MALLOC_CONF` (which one works depends on environment)
    + Compile time config, for jemallocator users: `JEMALLOC_SYS_WITH_MALLOC_CONF`
  - Con: The stats collected are about total memory allocated, with no differentiation for short/temporal vs long-lived allocations
  - Con: It's not built for Rust and difficult to infer stacktraces. Many symbols are mangled.
  - It is possible to do differential analysis: use one profile as a "base" and then diff vs other profiles.  However, the profile files use sequence numbers, so it's hard to tell which profile to use for what time.
  - Also there is no way to sort the output and the options for simplifying the output don't work very well
* [dhat](https://docs.rs/dhat/0.2.2/dhat/) - Swap out the global allocator, will profile your allocations & max heap usage
  - One advantage DHAT has over jeprof/jemalloc is lifetime / allocation length information.  This can be used to figure out long-held things
  - DHAT also tracks the entire call graph so it can produce a useful tree
  - It's online viewer is also much easier to use than `jeprof`
  - Unfortunately DHAT tracks every allocation so it's not good for production use
  - DHAT also crashes on some workloads.  This is really annoying.
* [Heaptrack](https://github.com/KDE/heaptrack) and [working with Rust](https://gist.github.com/HenningTimm/ab1e5c05867e9c528b38599693d70b35) works for Rust, but only on Linux.

After the above frustrations and investigations, I decided to write my own custom memory profiler - [Ying](https://github.com/velvia/ying-profiler) - a sampling profiler, built for rich Rust stack traces including inlined methods, which tracks retained memory and lifetimes.  Definitely experimental right now.

* [memory-profiler](https://github.com/koute/memory-profiler) - written in Rust by the Nokia team!
* [allocative](https://github.com/facebookexperimental/allocative) - generate runtime memory usage (not allocations) flamegraphs of structs you tag/derive using a custom trait. From Facebook.
* [memuse](https://docs.rs/memuse/latest/memuse/) - another approach to tag your structs and get dynamic (including heap) memory usage info
* [stats_alloc](https://crates.io/crates/stats_alloc) can dump out incremental stats about allocation.  Or just use `jemalloc-ctl`.
* [deepsize](https://crates.io/crates/deepsize) - macro to recursively find size of an object
* [Parity-util-mem](https://github.com/paritytech/parity-common/tree/master/parity-util-mem) - can find the size of collections as well?
* [Measuring Memory Usage in Rust](https://rust-analyzer.github.io//blog/2020/12/04/measuring-memory-usage-in-rust.html) - thoughts on working around the fact we don't have a GC to track deep memory usage

### Fast String Parsing

* [nom](https://docs.rs/nom/4.1.1/nom/) - a direct parser using macros, commonly accepted as fastest generic parser
* [pest](https://pest.rs/#editor) is a PEG parser using an external, easy to understand syntax file. Not quite as fast but might be easier to understand and debug.  There is also a [book](https://pest.rs/book/intro.html).
* [combine](https://github.com/Marwes/combine) is a parser combinator library, supposedly just as fast as nom, syntax seems slightly

* [simdutf8](https://github.com/rusticstuff/simdutf8) - SIMD lightning fast UTF-8 validation

### Bitpacking, Binary Structures, Serialization

* [bitpacking](https://crates.io/crates/bitpacking) - insanely fast integer bitpacking library
* [packed_struct](https://crates.io/crates/packed_struct) - bitfield packing/unpacking; can also pack arrays of bitfields; mixed endianness, etc.
* [rkyv](https://crates.io/crates/rkyv) - Zero-copy deserialization, for generic Rust structs, even trait objects. Uses relative pointers.
* [binary-layout](https://crates.io/crates/binary-layout) - "type-safe, inplace, zero-copy access to structured binary data" including open-ended byte arrays at the end
* [FlexBuffers](https://github.com/google/flatbuffers/tree/master/rust/flexbuffers) - version of FlatBuffers for schema-less data!
* [zerovec](https://docs.rs/zerovec/latest/zerovec/#Performance) - Clients upgrading to zerovec benefit from zero heap allocations when deserializing read-only data.
* [Speeding up incoming message parsing using nom](https://medium.com/tezedge/speeding-up-incoming-message-parsing-by-3-to-10-times-by-switching-from-serde-to-the-nom-library-a74b04391bb4) - a detailed guide to using nom for deserialization, much faster than Serde

The ideal performance-wise is to not need serialization at all; ie be able to read directly from portions of a binary byte slice.  There are some libraries for doing this, such as flatbuffers, or [flatdata](https://crates.io/crates/flatdata) for which there is a Rust crate; or Cap'n Proto.  However, there may be times when you want more control or things like Cap'n Proto are not good enough.

How do we perform low-level byte/bit twiddling and precise memory access?  Unfortunately, all structs in Rust basically need to have known sizes. There's something called [dynamically sized types](https://doc.rust-lang.org/nomicon/exotic-sizes.html) basically like slices where you can have the last element of a struct be an array of unknown size; however, they are virtually impossible to create and work with, and this only covers some cases anyhow.  So we will unfortunately need a combination of techniques.  In order of preference:
* Overall [scroll](https://crates.io/crates/scroll) is the best general-purpose struct serialization crate; it helps with reading integers and other fields too, and takes care of endianness.  It generates pretty efficient code.  It is a bit of a pain working with numeric enums however.
  - [num_enum](https://docs.rs/num_enum/0.5.0/num_enum/) - a way to derive TryFrom for numeric enums helps a little bit.
* I have found [plain](https://github.com/randomites/plain) works really well.  Mark your structs with `#[repr(C)]`.  It only helps with size and alignment, not endianness - so maybe more for in-memory structures or when you are sure you don't need code to work across endianness platforms.  If your structures are not aligned then use `#[repr(C, packed)]` or `#[align(1)]`.
* Use a crate such as [bytes](https://crates.io/crates/bytes) or [scroll](https://crates.io/crates/scroll) to help extract and write structs and primitives to/from buffers. Might need extra copying though. Also see [iobuf](https://crates.io/crates/iobuf)
* [rel-ptr](https://crates.io/crates/rel-ptr) - small library for relative pointers/offsets, should be super useful for custom file formats and binary/persistent data structures
* [tagptr](https://crates.io/crates/tagptr) - use a few bits in pointer words for metadata
* [Erasable](https://crates.io/crates/erasable) - type erased pointers
* [arrayref](https://docs.rs/arrayref/0.3.5/arrayref/) might help extract fixed size arrays from longer ones.
* [bytemuck](https://docs.rs/bytemuck/1.1.0/bytemuck/) for casts
* Also [zerocopy](https://docs.rs/zerocopy/latest/zerocopy/) with `FromBytes` and `AsBytes` traits for easy transmuting
* [bitmatch](https://crates.io/crates/bitmatch) could be great for bitfield parsing
  - Also see [zero](https://docs.rs/zero/0.1.2/zero/)
* Allocate a `Vec::<u8>` and [transmute](https://stackoverflow.com/questions/25917260/getting-raw-bytes-from-packed-struct) specific portions to/from structs of known size, or convert pointers within regions back to references:
```rust
    let foobar: *mut Foobar = mybytes[..].as_ptr() as *mut Foobar;
    let &mut Foobar = (unsafe { foobar.as_ref() }).expect("Cannot convert foobar to ref");
```
* Or [structview](https://crates.io/crates/structview) which offers types for unaligned integers etc.
* There are some DST crates worth checking out: [slice-dst](https://crates.io/crates/slice-dst), [thin-dst](https://crates.io/crates/thin-dst)
  - See [dyn_struct](https://crates.io/crates/dyn_struct) - a way to allocate DSTs on the heap using safe Rust
* As a last resort, work with [raw pointer](https://doc.rust-lang.org/std/primitive.pointer.html) math using the add/sub/offset methods, but this is REALLY UNSAFE.
```rust
    let foobar: *mut Foobar = mybytes[..].as_ptr() as *mut Foobar;
    unsafe {
      (*foobar).foo = 17;
      (*foobar).bar = -1;
    }
```

Want to zero memory quickly?  Use [slice_fill](https://docs.rs/slice-fill/1.0.1/slice_fill/) for memset optimization, since there is no memory filling for slices in Rust yet.

Also check out the crazy number of crates available under [compression](https://crates.io/search?q=compression&sort=recent-downloads) - including various interesting radix and trie data structures, and more compression algorithms that one has never heard of.

### Enums, Thin Pointers, Type Wrapping

A frequent problem, esp when working with data, is to have a "union" of different types.  Perhaps `Option` will suffice,
but sometimes we need to wrap `Vec<A>` and `Vec<B>` together in the same type.  We don't want to just use `Box<dyn
MyTrait>` as that allocates and results in dynamic dispatch.   Here are some crates and patterns that may help in
working with enums, or alternatives (Do see section on dyn any above):

* [enum_dispatch](https://docs.rs/enum_dispatch/0.2.1/enum_dispatch/index.html) - macro to implement the `dyn MyTrait` trait object pattern for enums, so we get fast static dispatch.  Basically implements traits for underlying types in enums
* [enum_delegate](https://lib.rs/crates/enum_delegate) is an alternative that works with associated types in traits - but not generics
* [strum](https://docs.rs/strum/latest/strum/) - derive strings and discriminant enums using macros
* You can use [`std::mem::discriminant`](https://doc.rust-lang.org/std/mem/fn.discriminant.html), a built-in function, to find the numeric discriminant for an enum
* Also enum discriminants can be explicitly specified using `#[repr(..)]`, see [here](https://users.rust-lang.org/t/inconsistencies-in-enum-discriminants/85968) - you can then transmute the enum into something explicit

Some non-enum crates that can also help:
* [ptr_union](https://docs.rs/ptr-union/latest/ptr_union/index.html) - "Pointer union types the since of a pointer by storing the tag in the alignment bits" :)
* [erasable](https://crates.io/crates/erasable) - "Type-erased thin pointers" - need to see how this is different from `std::any::Any`

### SIMD

There is this great article on [Towards fearless SIMD](https://raphlinus.github.io/rust/simd/2018/10/19/fearless-simd.html), about why SIMD is hard, and how to make it easier.   Along with pointers to many interesting crates doing SIMD.  (There is a built in crate, `std::simd` but it is really lacking) (However, [packed_simd](https://crates.io/crates/packed_simd) will soon be merged into it)

Another great article: [learning simd with rust by finding planets](https://medium.com/@razican/learning-simd-with-rust-by-finding-planets-b85ccfb724c3) is great too. simd is really about parallelism.  it is better to do multiple operations in a parallel (vertical) fashion, vector on vector, than to do horizontal operations where the different components of a wide register depend on one another.

* [ssimd](https://crates.io/crates/ssimd) - an effort to bring std::simd/packed_simd to Rust stable, with auto vectorization (meaning auto detect and implement code paths and fallbacks for when SIMD not available!)
* [faster](https://github.com/AdamNiederer/faster) - "SIMD for Humans" -- probably my favorite one, very high level translation of numeric map loops into SIMD
* [fearless_simd](https://github.com/raphlinus/fearless_simd), the blog post author's crate.  Runtime CPU detection and use of the most optimal code, no need for unsafe, but only focused on f32.
* [SIMDeez](https://github.com/jackmott/simdeez) - abstracts intrinsic SIMD instructions over different instruction sets & vector widths, runtime detection
* [simd_aligned](https://crates.io/crates/simd_aligned) and [simd_aligned_rust](https://github.com/ralfbiedert/simd_aligned_rust) - work with SIMD and packed_simd using vectors which have guaranteed alignment
* [aligned](https://docs.rs/aligned/0.3.2/aligned/) - newtype with byte alignment, for stack or heap!

* https://www.rustsim.org/blog/2020/03/23/simd-aosoa-in-nalgebra/

NOTE: `shuffle` in `packed_simd` is not very fast.  Replace with native instructions if possible.
