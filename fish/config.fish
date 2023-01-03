if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_config theme choose "Rosé Pine"

# Initialize Tools
starship init fish | source
zoxide init fish | source


# Flutter
set -gx PATH $HOME/.flutter/bin $PATH
set -gx PATH $HOME/.config/bin $PATH

# Language
set -x LANG en_US.UTF-8

# Editor
set -gx EDITOR nvim

# Git Configuration
set GLOBAL_GIT_CONFIG_PATH $HOME/.gitconfig
set GIT_CONFIG_PATH $HOME/.config/git/gitconfig 
if test ! -e $GLOBAL_GIT_CONFIG_PATH
    echo "not exist"
    ln -s $HOME/.config/git/gitconfig $HOME/.gitconfig
end


# Aliases
alias vi "nvim"
alias vim "nvim"
alias g git

  #exa replace ls
if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

  # Chinese NPM Source
alias cnpm "npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

# Key Bindings
 # peco
bind \cr peco_select_history # Bind for peco select history to Ctrl+R

 # vim-like
 # command + k not working after this
#bind \cl forward-char
