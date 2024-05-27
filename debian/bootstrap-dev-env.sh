#!/usr/bin/env sh

# Update
echo "Update Computer"

sudo apt update
sudo apt -y upgrade

# Install Basics
echo "Install Basics"
sudo apt install -y git vim build-essential htop tree wget unzip

# Install Applications
echo "Install Apps"
sudo apt install -y pipx zsh pylint mercurial exuberant-ctags cmake virtualenvwrapper curl libreadline-dev zsh unrar-free gpgv2 python3-pip virtualenvwrapper

# Install dependencies for development and shell
echo "Install Python devel files for pythonz"
sudo apt -y build-dep python3

# Install Development Dependencies
sudo apt install -y openjdk-17-jdk postgresql nodejs npm rlwrap

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash

# Fix Tilix VTE issue
ln -s /etc/profile.d/vte-219.sh /etc/profile.d/vte.sh

echo " "
echo " "
echo " "
echo "All of the automated stuff is done"
echo " "
echo "if you are using wsl2 and have not done this already update the /etc/wsl.conf use the example file as a guide" 
echo " "
echo "Get .gitconfig and id files and pull down /bin from github"
echo " "
echo "Run bootstrap-shell.sh for zsh, rvm, nvm, pythonz and run rvm-pythonz-update.sh
to make sure you have the latest versions"
echo " " 
echo "Run bootstrap-vim.sh to setup vim"