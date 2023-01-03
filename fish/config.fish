if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_config theme choose "Rosé Pine"

# Initialize Tools
starship init fish | source
zoxide init fish | source


# Flutter
set -gx PATH $HOME/.flutter/bin $PATH

# Language
set -x LANG en_US.UTF-8

# Editor
set -gx EDITOR nvim

# Aliases
alias vi "nvim"
alias vim "nvim"

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

alias cnpm "npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"
