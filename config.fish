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

# Environment vars
# set -x HADOOP_HOME blah blah

# rbenv support
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Aliases
alias subl3="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
alias nimrod="/usr/local/Cellar/nimrod/0.9.2/libexec/bin/nimrod"

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
