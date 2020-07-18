#!/usr/bin/env bash

# Add source files to sources.list
echo | sudo tee --append /etc/apt/sources.list
echo "#Add Sources" | sudo tee --append /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse" | sudo tee --append /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse" | sudo tee --append /etc/apt/sources.list
echo "deb-src  http://security.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse" | sudo tee --append /etc/apt/sources.list

# Update
echo "Update Computer"

sudo apt update
sudo apt -y upgrade

# Install Basics
echo "Install Basics"
sudo apt install -y ppa-purge git vim build-essential htop tree

# Install Applications
echo "Install Apps"
sudo apt install -y pylint mercurial ctags cmake virtualenvwrapper curl libreadline-dev zsh unrar rar gpgv2 python3-pip

# Install dependencies for development and shell
echo "Install Python devel files for pythonz"
sudo apt -y build-dep python3

# Install Development Dependencies
sudo apt -y install openjdk-11-jdk postgresql nodejs npm

echo "All of the automated stuff is done"
echo "Get  .gitconfig and id files and pull down /bin from github"
echo "Run bootstrap-shell.sh for zsh, rvm, nvm, pythonz and run rvm-pythonz-update.sh
to make sure you have the latest versions"
echo "Run bootstrap-vim.sh to setup vim"
