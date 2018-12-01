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

Rust-Java Integration / Rust FFI
* [Calling Rust from Java](http://stackoverflow.com/questions/30258427/calling-rust-from-java) - especially see the hint for using jnr-ffi
* [Exposing a Rust library to C](https://www.greyblake.com/blog/2017-08-10-exposing-rust-library-to-c/) - has some great tips on creating .so's and working with strings

### Performance and Low-Level Stuff

A big part of the appeal of Rust for me is super fast, SAFE low-level serialization and working with raw memory.  

* [Optimizing String Processing in Rust](http://lise-henry.github.io/articles/optimising_strings.html) - really useful stuff


