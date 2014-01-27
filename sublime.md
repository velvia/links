## Sublime Text packages

* Git - essential, esp quickly select what to check in, commit
* GitGutter - highlights lines changed since last commit
* DocBlockr - very useful for JavaDoc/ScalaDoc/etc.
* iOpener - open files with autocomplete search box, Emacs style.  Also lets you create new files! (Cmd-O)
    * AdvancedNewFile - pretty similar, creates dirs too - Cmd-Opt-N
* PlainTasks - an awesome TODO list manager
* Highlight - lets you export selected region as RDF text (w syntax highlighting) for Keynote presos
* SyncedSidebar - reveals current file in sidebar file explorer, great for big projects
* BracketHighlighter - shows current brackets, bracketing utils
* SublimeREPL

    {
      "installed_packages":
      [
        "AdvancedNewFile",
        "ApacheConf.tmLanguage",
        "BracketHighlighter",
        "DocBlockr",
        "Highlight",
        "iOpener",
        "Markdown Preview",
        "Modific",
        "PlainTasks",
        "SublimeREPL",
        "Theme - Spacegray"
      ]
    }

## Favorite Shortcuts

Some of these are SublimeText3 only.

* Jump To Definition - Opt+Cmd+Down  -- if you create a project (sbt-sublime) then you can jump into library sources too :)
*  Jump Back / Jump Forward - Cmd+-, Cmd+Shift+- - like the back or forward button in browser, super useful in conjunction with above

Also, have a look at how to [launch SublimeText from OSX Terminal](https://gist.github.com/artero/1236170).

## Sublime Text config

    {
      "bold_folder_labels": true,
      "caret_style": "phase",
      "color_scheme": "Packages/User/customizedBlackboard.tmTheme",
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
      "font_size": 12,
      "highlight_line": true,
      "ignored_packages":
      [
        "Vintage"
      ],
      "line_padding_bottom": 1,
      "rulers":
      [
        110
      ],
      "tab_size": 2,
      "theme": "Spacegray.sublime-theme",
      "translate_tabs_to_spaces": true,
      "trim_automatic_white_space": true,
      "trim_trailing_white_space_on_save": true,
      "use_tab_stops": false
    }

### Key bindings - user

    [
        { "keys": ["super+alt+s"], "command": "sort_lines", "args": {"case_sensitive": false} },
        { "keys": ["super+shift+r"], "command": "reveal_in_side_bar" }
    ]

## Blogs

TBD.
