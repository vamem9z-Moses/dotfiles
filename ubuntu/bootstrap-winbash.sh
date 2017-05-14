#!/usr/bin/env bash

# Update
echo "Update Computer"

sudo apt-get update
sudo apt-get -y upgrade

# Install Basics
echo "Install Basics"
sudo apt-get install -y ppa-purge git vim build-essential aptitude htop tree

# Install Applications
echo "Install Apps"
sudo apt-get install -y pylint mercurial dkms sbcl ctags cmake libpython2.7-dev virtualenvwrapper curl libreadline-dev zsh unrar rar gpgv2 python-pip python3-pip

# Update pip
echo "Updating pip"
pip install --upgrade pip
pip3 install --upgrade pip

# Install pysmell
echo "Install pysmell"
pip install --user pysmell

echo "Install virtualenvwrapper"
pip3 install --user virtualenvwrapper

# Install dependencies for development and shell
echo "Install Python 2.7 devel files"
sudo apt-get -y build-dep python2.7

# Install updated vim for trusty 14.04
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update
sudo apt-get -y install vim

# Install openjdk8
sudo apt-get -y install openjdk-8-jdk

#echo "Install Python 3.6"
#sudo add-apt-repository -y ppa:jonathonf/python-3.6
#sudo apt-get update
#sudo apt-get -y install python3.6

echo "All of the automated stuff is done"
echo "Get  .gitconfig and id files and pull down /bin from github"
echo "Run bootstrap-shell.sh for zsh, rvm, nvm, pythonz and run rvm-pythonz-update.sh
to make sure you have the latest versions"
echo "Run bootstrap-vim.sh to setup vim"
