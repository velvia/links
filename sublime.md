<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Sublime Text packages](#sublime-text-packages)
- [Favorite Shortcuts](#favorite-shortcuts)
- [Sublime Text config](#sublime-text-config)
  - [Python Setup](#python-setup)
  - [Key bindings - user](#key-bindings---user)
  - [SublimeHighlight config](#sublimehighlight-config)
- [Blogs and Articles](#blogs-and-articles)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Sublime Text packages

* Git - essential, esp quickly select what to check in, commit
* GitGutter - highlights lines changed since last commit
* DocBlockr - very useful for JavaDoc/ScalaDoc/etc.
* iOpener - open files with autocomplete search box, Emacs style.  Also lets you create new files! (Cmd-O). NOTE: doesn't work with SublimeText4. Use AdvancedNewFile instead.
    * AdvancedNewFile - pretty similar, creates dirs too - Cmd-Opt-N
* PlainTasks - an awesome TODO list manager
* Highlight - lets you export selected region as RDF text (w syntax highlighting) for Keynote presos
* SyncedSidebar - reveals current file in sidebar file explorer, great for big projects
* MarkdownEditing - my favorite Markdown formatting and editing mode.  Even does code block syntax highlighting!
* [SideBarFolders](https://sublime.wbond.net/packages/SideBarFolders) - quickly switch set of folders listed in side bar.  Think of it as quick way to switch "projects" without needing to generate projects or open a new window.
* BracketHighlighter - shows current brackets, bracketing utils
* [MaxPane](https://github.com/jisaacks/MaxPane) and [Origami](https://github.com/SublimeText/Origami) - awesome plugins for working with panes
* [Sublimall](http://sublimall.org/#) - sync your SublimeText config to cloud, all your machines
* [SublimeLinter](http://www.sublimelinter.com/en/stable/) - various linters for different languages. 
* [SublimeSBT](https://github.com/jarhart/SublimeSBT) - SBT REPL integration with compile error highlighting
* [Scala Worksheet](https://bitbucket.org/inkytonik/scalaworksheet) - like the feature in the Scala IDE, displaying code and results side by side.  A bit rough.
* [SublimeTableEditor](https://github.com/vkocubinsky/SublimeTableEditor/blob/master/README.md) - pretty awesome, edit Markdown text tables with ease
* SublimeREPL
* [TabNine](https://tabnine.com) - an ML-based autocompleter, written in Rust

Themes:

* [Afterglow](https://github.com/YabataDesign/afterglow-theme) - excellent theme and syntax color highlighting package. Includes file type icons in side bar!

My package control config:

    {
      "installed_packages":
      [
        "ApacheConf.tmLanguage",
        "BracketHighlighter",
        "DocBlockr",
        "Dockerfile Syntax Highlighting",
        "Git",
        "GitGutter",
        "iOpener",
        "MarkdownEditing",
        "Package Control",
        "SideBarEnhancements",
        "SyncedSideBar",
        "SublimeSBT",
        "Theme - Afterglow",
        "Theme - Spacegray"
      ]
    }

Other useful packages:

* [Text Pastry](https://github.com/duydao/Text-Pastry/blob/master/README.md)
* [OmniDocs](https://sublime.wbond.net/packages/OmniDocs) - potentially useful doc lookup for languages, but Scala/Scalex support is quite lacking right now.

## Favorite Shortcuts

Some of these are SublimeText3 only.

* Jump To Definition - Opt+Cmd+Down  -- if you create a project (sbt-sublime) then you can jump into library sources too :)
* Jump Back / Jump Forward - Opt-Cmd-Left, Opt-Cmd-Right - like the back or forward button in browser, super useful in conjunction with above
    - (Assumes you use the key bindings options below to modify defaults)
* Reveal in sidebar - Cmd+shift+r  -- reveal current file in sidebar


Also, have a look at how to [launch SublimeText from OSX Terminal](https://gist.github.com/artero/1236170).

## Sublime Text config

Note: `indent_to_bracket` means when you break up lines of long arguments it will indent automatically to beg of first bracket of prev line!

    {
      "added_words":
      [
        "Facebook",
        "Pinterest",
        "datastore",
        "blog",
        "typeclass",
        "timestamp"
      ],
      "bold_folder_labels": true,
      "caret_style": "phase",
      "color_scheme": "Packages/Theme - Afterglow/Afterglow.tmTheme",
      "fade_fold_buttons": false,
      "file_exclude_patterns":
      [
        ".*",
        "*.pyc",
        "*.pyo",
        "*.exe",
        "*.dll",
        "*.obj",
        "*.o",
        "*.a",
        "*.lib",
        "*.so",
        "*.dylib",
        "*.ncb",
        "*.sdf",
        "*.suo",
        "*.pdb",
        "*.idb",
        ".DS_Store",
        "*.class",
        "*.psd",
        "*.db",
        ".idea*",
        ".ensime*"
      ],
      "folder_no_icon": true,
      "font_size": 12,
      "highlight_line": true,
      "highlight_modified_tabs": true,
      "ignored_packages":
      [
        "Markdown",
        "Vintage"
      ],
      "indent_guide_options":
      [
        "draw_normal",
        "draw_active"
      ],
      "indent_to_bracket": true,
      "line_padding_bottom": 1,
      "rulers":
      [
        110
      ],
      "tab_size": 2,
      "tabs_small": true,
      "theme": "Afterglow.sublime-theme",
      "translate_tabs_to_spaces": true,
      "trim_automatic_white_space": true,
      "trim_trailing_white_space_on_save": true,
      "use_tab_stops": false
    }

### Python Setup

Install the following packages:
* Anaconda
* SublimeLinter

`brew install mypy` for Python3 type checking, then add following to SublimeLinter config:

```
    "linters": {
        // The name of the linter you installed
        "mypy": {
            // Disables the linter. The default here is 'not set'
            "disable": false,
            // Additional arguments for the command line. Either a string
            // or an array. If set to a string, we 'shlex.split' it*.
            // E.g. '--ignore D112' or ['--config', './.config/foo.ini']
            //
            // * Note: Use proper quoting around paths esp. on Windows!
            "args": ["--ignore-missing-imports"],
            // Path to the executable to be used. Either a string or an
            // array. E.g. ['nvm', 'exec', '8.6', 'eslint']
            "executable": "/usr/local/bin/mypy",
            // A modified runtime environment for the lint job. Settings here
            // override the default, inherited ENV.
            "env": {},
            // Exclude files that match the given pattern(s).
            "excludes": ["!*/*.py"],
            // Suppress errors that match the the given pattern(s).
            // Either a 'string' or an 'array'. Each input string is handled as
            // a case-insensitive regex pattern and matched against the
            // error_type, code, and message. If it matches, the error will be
            // thrown away.
            // E.g. ["warning: ", "W3\d\d: ", "missing <!DOCTYPE> declaration"]
            "filter_errors": [],
            // Lint mode determines when the linter is run. The linter setting
            // will take precedence over the global setting.
            "lint_mode": "save",
            // Determines for which views this linter will run.
            "selector": "",
            // A list of additional style definition blocks.
            "styles": [
                {
                    // Instead of 'types' you can specify error 'codes' for
                    // a style definition block
                    "codes": [""]
                }
            ],
            // The current working dir the lint job will run in.
            "working_dir": "",
            // **Only valid for PythonLinter**
            // Specify which python to use. Either a number or full path
            // to a python binary. SL will then basically use 'python -m'
            // to run the linter.
            "python": 3,
            // **Only valid for NodeLinter**
            // If true, will *not* use a globally installed binary
            "disable_if_not_dependency": false
        }
    },

```

Also, custom Anaconda language-specific settings for Python3:

```
// These settings override both User and Default settings for the Python syntax
{
   "tab_size": 4,
   "pep8_max_line_length": 120,
   "python_interpreter": "/Users/evan/.pyenv/shims/python3",
   "pep8_ignore":
    [
        "E309",
        "E251"
    ],
    "anaconda_linting_behaviour": "load-save",
    "anaconda_linter_phantoms": true,
    "mypy": true,
}
```

Actually, one might want to just forget SublimeLinter and just use [Anaconda with MyPy](https://blog.vikborges.com/articles/python-static-type-checking-on-sublime-text-3-with-mypy).

### Key bindings - user

    [
        { "keys": ["super+alt+s"], "command": "sort_lines", "args": {"case_sensitive": false} },
        { "keys": ["super+alt+r"], "command": "reveal_in_side_bar" },
        { "keys": ["f12"], "command": "lsp_symbol_definition" },
        // Without these lines Home/End moves to beg/end of doc!  Not acceptable!
        { "keys": ["home"], "command": "move_to", "args": {"to": "bol"} },
        { "keys": ["end"], "command": "move_to", "args": {"to": "eol"} },
        { "keys": ["shift+end"], "command": "move_to", "args": {"to": "eol", "extend": true} },
        { "keys": ["shift+home"], "command": "move_to", "args": {"to": "bol", "extend": true } },
        { "keys": ["super+alt+left"], "command": "jump_back" },
        { "keys": ["super+alt+right"], "command": "jump_forward" }
    ]

### SublimeHighlight config

```
{
    "theme": "monokai",
    "linenos": "inline",
    "noclasses": true,
    "fontface": "Menlo"
}
```

NOTE: it seems latest SublimeHighlight is broken.  Need to now export and view in MS Word and then copy and paste.

## Blogs and Articles

* A collection of [favorite enhancements](http://webdesign.tutsplus.com/articles/simple-visual-enhancements-for-better-coding-in-sublime-text--webdesign-18052)
* [Slap](https://github.com/slap-editor/slap) - a Sublime-inspired terminal editor!
