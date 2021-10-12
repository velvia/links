<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Git Config](#git-config)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Git Config

```
[commit]
        verbose = true
[alias]
    webui = !/Users/evan/.git-webui/release/libexec/git-core/git-webui
    co = checkout
    st = status
    log15 = log --oneline --pretty=format:'%h %ad | %s%d [%an]' --date=short -15
    logme = log --author=Evan --oneline --pretty=format:'%h %ad | %s%d [%an]' --date=short -15
    log30 = log --oneline --pretty=format:'%h %ad | %s%d [%an]' --date=short -30
        audit30 = log --oneline --pretty=format:'%h|%ad|%an|%ae|%s' --date=short -30
        smerge = submodule update --remote --merge
        spush = push --recurse-submodules=on-demand  
```