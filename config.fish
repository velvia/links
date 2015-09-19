# in .config/fish/config.fish:
# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'


function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end

function list-java
  lsof -a -d cwd -c java
end

function list-ports
  lsof -iTCP -sTCP:LISTEN -P
end

# Environment vars
# NOTE: below is for JDK 8
set -x SBT_OPTS "-XX:+CMSClassUnloadingEnabled -Xmx5g -XX:MaxMetaspaceSize=512m"
# relies on setting up host-only networking with static IP in Linux VM
set -x DOCKER_HOST tcp://192.168.56.10:2375
set -x EDITOR /usr/bin/vim

# set -x DYLD_LIBRARY_PATH $DYLD_LIBRARY_PATH /usr/local/lib/rustlib/x86_64-apple-darwin/lib/

set PATH ~/bin $PATH

# rbenv support
# set PATH $HOME/.rbenv/bin $PATH
# set PATH $HOME/.rbenv/shims $PATH
# rbenv rehash >/dev/null ^&1
set -gx RBENV_ROOT /usr/local/Cellar/rbenv/0.4.0
# . (rbenv init -|psub)

# Aliases
# alias subl3="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
