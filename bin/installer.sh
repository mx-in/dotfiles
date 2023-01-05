#!/bin/bash

# Tools
#
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
brew install sqlite

brew install neovim
brew install youtube-dl
brew install ffmpeg
# Github
brew install gh
brew install cocoapods
brew install carthage
brew install tldr
brew install rust

git lfs install

# Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
~/.local/share/nvim/site/pack/packer/start/packer.nvim

# casks
if [[ $PLATFORM == 'macos' ]]; then
   brew install --cask google-chrome
   brew install --cask 1password
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
   brew install --cask snipaste

#Bin executable
chmod +x ~/.local/bin/*
