# Dotfiles

These are my key dotfiles. The current configuration assumes Ubuntu 14.04
(specifically Xubuntu 14.04). 

## Setup

To use you'll want to install the following:

1. Vim
1. oh-my-zsh
1. zsh
1. virtualenv
1. konsole - set as default terminal
1. golang
1. nsf/gocode in the src directory of any golang workspaces
1. git

In addition, there are a few prerequisites for the vim
configuration:

1. CMake and the python libraries 2.7+ for YouCompleteMe
1. pysmell

Once these are installed you'll want to run the bootstrap script. Which will
backup your current dotfiles and replace them with those in this repo.

