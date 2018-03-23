## Git aliases

```
[alias]
    webui = !/Users/evan/.git-webui/release/libexec/git-core/git-webui
    co = checkout
    st = status
    log15 = log --oneline --pretty=format:'%h %ad | %s%d [%an]' --date=short -15
    log30 = log --oneline --pretty=format:'%h %ad | %s%d [%an]' --date=short -30
        audit30 = log --oneline --pretty=format:'%h|%ad|%an|%ae|%s' --date=short -30
        smerge = submodule update --remote --merge
        spush = push --recurse-submodules=on-demand  
```