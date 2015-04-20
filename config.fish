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

function search-staging
  knife search node "role:$argv AND chef_environment:azure-staging"
end

function search-rc
  knife search node "role:$argv AND chef_environment:azure-rc"
end

function list-java
  lsof -a -d cwd -c java
end

# Environment vars
# set -x HADOOP_HOME blah blah
set -x SBT_OPTS "-XX:MaxPermSize=512m -XX:+CMSClassUnloadingEnabled -Xmx8g"
set -x DOCKER_HOST (bash -c '$(dvm env);echo $DOCKER_HOST')
set -x EDITOR /usr/bin/vim

set -x DYLD_LIBRARY_PATH $DYLD_LIBRARY_PATH /usr/local/lib/rustlib/x86_64-apple-darwin/lib/

# Docker vars

set -x DOCKER_HOST tcp://(boot2docker ip 2>/dev/null):2376
set -x DOCKER_CERT_PATH /Users/evanchan/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 1

set PATH ~/bin $PATH

# rbenv support
# set PATH $HOME/.rbenv/bin $PATH
# set PATH $HOME/.rbenv/shims $PATH
# rbenv rehash >/dev/null ^&1
set -gx RBENV_ROOT /usr/local/Cellar/rbenv/0.4.0
. (rbenv init -|psub)

# Aliases
alias subl3="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
