#!/bin/fish

# Initialize Tools
function init_tools
    starship init fish | source
    zoxide init fish | source
    thefuck --alias | source
    pyenv init - | source
    status --is-interactive; and pyenv virtualenv-init - | source
end

function proxy_apply --argument-names profile
    switch $profile
    case clash
        set -x -g http_proxy  http://127.0.0.1:7890
        set -x -g https_proxy http://127.0.0.1:7890
        set -x -g all_proxy   socks5://127.0.0.1:7890
        git config --global --unset http.proxy
        git config --global --unset https.proxy
    case surge
        set -x -g http_proxy  http://127.0.0.1:8234
        set -x -g https_proxy http://127.0.0.1:8234
        set -x -g all_proxy   socks5://127.0.0.1:8235
        git config --global http.proxy  http://127.0.0.1:8234
        git config --global https.proxy http://127.0.0.1:8234
    case off
        set -e http_proxy https_proxy all_proxy
        git config --global --unset http.proxy
        git config --global --unset https.proxy
    case '*'
        echo "Unknown proxy profile '$profile' (use clash|surge|off)" >&2
        return 1
    end
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
    #use eza to replace ll, la
    if type -q eza
        alias ll "eza -l -g --icons"
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

    # GitHub Copilot shortcuts
    alias expl "gh copilot explain"
    alias sugg "gh copilot suggest"
end


function key_binding
    bind \cr peco_select_history
    bind \co lfcd 

    # vim-like
    bind \cl forward-char
    bind \ct "fish -c \"tmux_smart_session --init \$PWD\""
end

function proxy_switch --argument-names profile
    if test -z "$profile"
        echo "Usage: proxy_switch {clash|surge|off}" >&2
        return 1
    end

    proxy_apply $profile; or return $status
    set -U proxy_profile $profile
end

# Remember the last proxy profile and apply it on every new shell.
if not set -q proxy_profile
    set -U proxy_profile clash
end

init_tools
proxy_apply $proxy_profile
fish_setup
add_path
git_config
setup_aliases
key_binding

source $HOME/.config/fish/privacy.fish
