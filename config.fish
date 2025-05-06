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

# Disable sleep on Mac temporarily.  Runs in foreground.  Ctrl-C to cancel.
function mac-no-sleep
  # On older Mac's, use pmset noidle... but caffeinate works better on newer Macs
  caffeinate
end

function refresh-calendar-agent
  launchctl stop com.apple.CalendarAgent
  launchctl start com.apple.CalendarAgent
end

eval (/opt/homebrew/bin/brew shellenv)
set -gx PATH "$HOME/.cargo/bin" $PATH

# export SSH_AUTH_SOCK to LaunchAgents so GUI apps see it
set -gx SSH_AUTH_SOCK $SSH_AUTH_SOCK
launchctl setenv SSH_AUTH_SOCK $SSH_AUTH_SOCK

zoxide init fish | source

alias subl3="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
alias rclip="cargo clippy --all --tests -- -D clippy::all -D warnings -D clippy::disallowed_method"

# Environment vars
# NOTE: below is for JDK 8
set -x SBT_OPTS "-XX:+CMSClassUnloadingEnabled -Xmx5g -XX:MaxMetaspaceSize=512m"
# relies on setting up host-only networking with static IP in Linux VM
# set -x DOCKER_HOST tcp://192.168.56.10:2375
set -x EDITOR /usr/bin/vim
set -x JAVA_HOME (jenv javahome)
set -x ASYNC_PROFILER_DIR "$HOME/src/github/async-profiler"
set -x FLAME_GRAPH_DIR "$HOME/src/github/FlameGraph"

# Helps performance of standard OSX Malloc for CLI apps
set -x MallocNanoZone 1

# set -x DYLD_LIBRARY_PATH $DYLD_LIBRARY_PATH /usr/local/lib/rustlib/x86_64-apple-darwin/lib/

set PATH ~/bin $PATH

# for jenv
status --is-interactive; and jenv init - | source

# rbenv support
# set PATH $HOME/.rbenv/bin $PATH
# set PATH $HOME/.rbenv/shims $PATH
# rbenv rehash >/dev/null ^&1
set -gx RBENV_ROOT /usr/local/Cellar/rbenv/0.4.0
# . (rbenv init -|psub)
# status --is-interactive; and source (rbenv init -|psub)

# Python set
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end
status --is-interactive; and pyenv virtualenv-init - | source
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# Aliases
alias git=hub
alias subl3="'/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'"
alias java8="set -x JAVA_HOME /Users/evan/.jenv/versions/1.8"
alias java11="set -x JAVA_HOME /Users/evan/.jenv/versions/11.0"


### For personal use only
# Functions for photo backups by year
function photo-backup-to-cloud -a year -d "Backup SELECT photos in /Volumes/ChanPhotos1 to B2/cloud"
   if test $year -ge 2024
      set volume ChanPhotos23
   else
      set volume ChanPhotos1
   end
   rclone sync -v --include "$year/*/*/select/**" --include "$year/*/ALBUMS/**" --include "$year*" --transfers 32 /Volumes/$volume/Photos/ b2-evan:Velvia-PhotosPrivate/
end

function photo-backup-to-drive -a year -d "Backup ALL photos in /Volumes/ChanPhotos1 to second drive"
   rclone sync -v --include "$year/*/**" --include "$year/*/ALBUMS/**" --include "$year*" --transfers 32 /Volumes/ChanPhotos1/Photos/ /Vo
lumes/ChanPhotosB/Photos/
end