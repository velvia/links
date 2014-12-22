## Some links on Rust

Dealing with strings are confusing in Rust, because there are two types: a heap-
allocated `String` and a pointer to a slice of String bytes: `&str`.  Knowing
what to use, and defining structures on them, immediately exposes the steep
learning curve of ownership.

See the [Guide to Strings](http://doc.rust-lang.org/guide-strings.html) for some help.

* [Rust IRC channel](http://client00.chat.mibbit.com/?server=irc.mozilla.org&channel=%23rust)
* [Rust for Rubyists](http://www.rustforrubyists.com/)
* [Rust Playpen](http://play.rust-lang.org/) - closest thing to a REPL  :(
* [On Rusts Module System](https://gist.github.com/DanielKeep/470f4e114d28cd0c8d43) - good explanation of paths, naming, modules -- see this when compiler complains about cannot find symbols
* [Rust By Example](http://rustbyexample.com/) - also the guide on their site is pretty good.
* [Columnarization in Rust](http://www.frankmcsherry.org/columnarization/serialization/rust/2014/12/15/Columnarization-in-Rust.html)