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

1. ctags
1. CMake and the python libraries 2.7+ (libpython2.7-dev) for YouCompleteMe
1. pysmell

You'll also want to make sure that the Markdown.pl file is in ~/bin or change
its location in .vimrc.  My bin repo has the Markdown.pl file in it.

Once these are installed you'll want to run the bootstrap script, which will
backup your current dotfiles and replace them with those in this repo.

