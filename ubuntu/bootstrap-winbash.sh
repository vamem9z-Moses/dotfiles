#!/usr/bin/env bash

# Update
echo "Update Computer"

sudo apt-get update
sudo apt-get -y upgrade

# Install Basics
echo "Install Basics"

sudo apt-get install -y ppa-purge git vim gedit build-essential aptitude lm-sensors htop tree

# Remove Stuff I don't use
echo "Remove Apps I don't Use"
sudo apt-get remove -y gnumeric abiword

# Install Applications
echo "Install Apps"
sudo apt-get install -y emacs pylint mercurial dkms sbcl ctags cmake libpython2.7-dev virtualenvwrapper curl libreadline-dev zsh konsole unrar rar

# Install pysmell
echo "Install pysmell"
sudo pip install pysmell

# Install dependencies for development and shell
echo "Install Python 2.7 devel files"
sudo apt-get -y build-dep python2.7

# Install updated vim for trusty 14.04
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get install vim

# Install openjdk8
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk

echo "All of the automated stuff is done"
echo "Get  .gitconfig and id files and pull down /bin from github"
echo "Run bootstrap-shell.sh for zsh, rvm, nvm, pythonz and run rvm-pythonz-update.sh
to make sure you have the latest versions"
echo "Run bootstrap-vim.sh to setup vim"
echo "You'll want to install skype, vagrant, virtualbox, google chrome, racket, go, and dart from their websites"
