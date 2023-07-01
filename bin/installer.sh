#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ $(uname -p) == 'arm' ]]; then
    export PATH=/opt/homebrew/bin:$PATH
fi
# Tools
# file's metadata viewer
brew install exiftool
# Git Large File Storage
brew install git-lfs
# Smarter cd
brew install zoxide
# List files
brew install lf
brew install lazygit
# Filter tool
brew install peco
# Modern ls
brew install exa
# Shell prompt
brew install starship
brew install tmux
brew install ripgrep
brew install pnpm
brew install npm
brew install fish
brew install fisher
brew install neovim
brew install tree-sitter
brew install yt-dlp
brew install ffmpeg
brew install sqlite
brew install gh
brew install git-lfs
brew install rust
brew install cocoapods
brew install carthage
brew install tldr
brew install btop
brew install thefuck
brew install tmux-mem-cpu-load
brew install bat

# Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# casks
brew install --cask google-chrome
brew install --cask alacritty
brew install --cask karabiner-elements
brew install --cask discord          
brew install --cask logseq
brew install --cask postman          
brew install --cask slack
brew install --cask dash
brew install --cask telegram
brew install --cask surge
brew install --cask openinterminal
brew install --cask hiddenbar
brew install --cask betterdisplay
brew install --cask flux
brew install --cask grammarly-desktop
brew install --cask raycast 
brew install --cask itsycal
brew install --cask squirrel
brew install --cask visual-studio-code
brew install --cask typora
brew install --cask one-switch
brew install --cask shottr
brew install --cask openinterminal
brew install --cask intellij-idea
brew install --cask datagrip
brew install --cask coconutbattery
brew install --cask calibre
brew install --cask pdf-expert
brew install --cask zoom
brew install --cask tencent-meeting
brew install --cask fork
brew install --cask appcleaner
brew install --cask anki
brew install --cask iterm2
brew install --cask android-studio
brew install --cask the-unarchiver
brew install --cask kindle
brew install --cask imazing

#Bin executable
chmod +x ~/.config/bin/*
