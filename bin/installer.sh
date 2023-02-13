#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Tools
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
brew install youtube-dl
brew install ffmpeg
brew install sqlite
brew install gh
brew install git-lfs
brew install rust
brew install cocoapods
brew install carthage
brew install tldr
brew install btop

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
brew install --cask surge@3.5.9
brew install --cask openinterminal
brew install --cask hiddenbar
brew install --cask betterdisplay
brew install --cask flux
brew install --cask grammarly
brew install --cask raycast 
brew install --cask itsycal
brew install --cask squirrel

#Bin executable
chmod +x ~/.config/bin/*
