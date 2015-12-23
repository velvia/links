<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Sublime Text packages](#sublime-text-packages)
- [Favorite Shortcuts](#favorite-shortcuts)
- [Sublime Text config](#sublime-text-config)
  - [Key bindings - user](#key-bindings---user)
  - [SublimeHighlight config](#sublimehighlight-config)
- [Blogs and Articles](#blogs-and-articles)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Sublime Text packages

* Git - essential, esp quickly select what to check in, commit
* GitGutter - highlights lines changed since last commit
* DocBlockr - very useful for JavaDoc/ScalaDoc/etc.
* iOpener - open files with autocomplete search box, Emacs style.  Also lets you create new files! (Cmd-O)
    * AdvancedNewFile - pretty similar, creates dirs too - Cmd-Opt-N
* PlainTasks - an awesome TODO list manager
* Highlight - lets you export selected region as RDF text (w syntax highlighting) for Keynote presos
* SyncedSidebar - reveals current file in sidebar file explorer, great for big projects
* MarkdownEditing - my favorite Markdown formatting and editing mode.  Even does code block syntax highlighting!
* [SideBarFolders](https://sublime.wbond.net/packages/SideBarFolders) - quickly switch set of folders listed in side bar.  Think of it as quick way to switch "projects" without needing to generate projects or open a new window.
* BracketHighlighter - shows current brackets, bracketing utils
* [MaxPane](https://github.com/jisaacks/MaxPane) and [Origami](https://github.com/SublimeText/Origami) - awesome plugins for working with panes
* [Sublimall](http://sublimall.org/#) - sync your SublimeText config to cloud, all your machines
* [SublimeSBT](https://github.com/jarhart/SublimeSBT) - SBT REPL integration with compile error highlighting
* [Scala Worksheet](https://bitbucket.org/inkytonik/scalaworksheet) - like the feature in the Scala IDE, displaying code and results side by side.  A bit rough.
* [SublimeTableEditor](https://github.com/vkocubinsky/SublimeTableEditor/blob/master/README.md) - pretty awesome, edit Markdown text tables with ease
* SublimeREPL

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
* Jump Back / Jump Forward - Cmd+-, Cmd+Shift+- - like the back or forward button in browser, super useful in conjunction with above
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

### Key bindings - user

    [
        { "keys": ["super+alt+s"], "command": "sort_lines", "args": {"case_sensitive": false} },
        { "keys": ["super+alt+r"], "command": "reveal_in_side_bar" },
        // Without these lines Home/End moves to beg/end of doc!  Not acceptable!
        { "keys": ["home"], "command": "move_to", "args": {"to": "bol"} },
        { "keys": ["end"], "command": "move_to", "args": {"to": "eol"} },
        { "keys": ["shift+end"], "command": "move_to", "args": {"to": "eol", "extend": true} },
        { "keys": ["shift+home"], "command": "move_to", "args": {"to": "bol", "extend": true } }
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


## Blogs and Articles

* A collection of [favorite enhancements](http://webdesign.tutsplus.com/articles/simple-visual-enhancements-for-better-coding-in-sublime-text--webdesign-18052)

