#!/bin/fish

# Initialize Tools
function init_tools
    starship init fish | source
    zoxide init fish | source
    thefuck --alias | source
end

function proxy_setting
    set -x -g https_proxy http://127.0.0.1:6152
    set -x -g http_proxy http://127.0.0.1:6152
    set -x -g all_proxy socks5://127.0.0.1:6153
end

function fish_setup
    set -U fish_greeting "--!"
    # Language
    set -x LANG en_US.UTF-8
    # Editor
    set -gx EDITOR nvim
    fish_config theme choose "Rosé Pine"
end


function add_path
    #fish_add_path $HOME/.flutter/bin
    fish_add_path $HOME/.config/bin
end

function git_config
    set GLOBAL_GIT_CONFIG_PATH $HOME/.gitconfig
    set GIT_CONFIG_PATH $HOME/.config/git/gitconfig 
    if test ! -e $GLOBAL_GIT_CONFIG_PATH
        echo "not exist"
        ln -s $HOME/.config/git/gitconfig $HOME/.gitconfig
    end
end

function setup_aliases
    alias vi "nvim"
    alias vim "nvim"
    alias g git
    alias top btop

    #use exa to replace ll, la
    if type -q exa
        alias ll "exa -l -g --icons"
        alias lla "ll -a"
    end

    # #use bat to replace cat
    # if type -q cat
    #     alias cat "bat"
    # end

    # Chinese NPM Source
    alias cnpm "npm --registry=https://registry.npm.taobao.org \
    --cache=$HOME/.npm/.cache/cnpm \
    --disturl=https://npm.taobao.org/dist \
    --userconfig=$HOME/.cnpmrc"
end


function key_binding
    bind \cr peco_select_history
    bind \co lfcd 

    # vim-like
    bind \cl forward-char
    bind \ct "fish -c \"tmux_smart_session --init \$PWD\""
end

init_tools
proxy_setting
fish_setup
add_path
git_config
setup_aliases
key_binding

source $HOME/.config/fish/privacy.fish
