#!/usr/bin/env bash

# Update
echo "Update Computer"

sudo apt-get update
sudo apt-get -y upgrade

# Install Basics
echo "Install Basics"

sudo apt-get install -y git lm-sensors curl wget gpg-agent gnupg gnupg-agent vim gedit build-essential aptitude lm-sensors htop tree


# Install Applications
echo "Install Apps"
sudo apt-get install -y emacs pylint mercurial dkms okular okular-extra-backends aisleriot ctags cmake virtualenvwrapper libreadline-dev zsh konsole unrar rar ttf-mscorefonts-installer libdvdread7 firewalld firewall-applet chromium-browser filezilla

echo "Install CSS"
sudo /usr/share/doc/libdvdread4/install-css.sh


# Install dependencies for development and shell
echo "Install Python3  devel files"
sudo apt-get -y build-dep python3

echo "All of the automated stuff is done"
echo "Get  .gitconfig and id files and pull down /bin from github"
echo "Run bootstrap-thinkpad.sh if your computer is a thinkpad"
echo "Run bootstrap-shell.sh for zsh, rvm, nvm, pythonz and run rvm-pythonz-update.sh
to make sure you have the latest versions"
echo "Run bootstrap-vim.sh to setup vim"
echo "You'll want to install skype, vagrant, virtualbox, google chrome, racket, go, and dart from their websites"
