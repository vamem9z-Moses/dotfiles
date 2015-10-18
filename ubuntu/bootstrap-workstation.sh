#!/usr/bin/env bash

# Update
echo "Update Computer"

sudo apt-get update
sudo apt-get -y upgrade

# Install Basics
echo "Install Basics"

sudo apt-get install -y git vim gedit build-essential aptitude lm-sensors htop tree

# Remove Stuff I don't use
echo "Remove Apps I don't Use"
sudo apt-get remove -y gnumeric abiword

# Install Applications
echo "Install Apps"
sudo apt-get install -y emacs gnome-disk-utility gparted pylint gstreamer0.10-plugins-bad mercurial dkms sbcl okular okular-extra-backends aisleriot ctags cmake libpython2.7-dev virtualenvwrapper curl libreadline-dev zsh konsole unrar rar ttf-mscorefonts-installer libreoffice gstreamer0.10-plugins-ugly libxine1-ffmpeg gxine mencoder libdvdread4 totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 libavcodec-extra openjdk-7-jdk vlc clementine wine nautilus-dropbox firewalld firewall-applet chromium-browser filezilla gdebi

echo "Install CSS"
sudo /usr/share/doc/libdvdread4/install-css.sh

# Install pysmell
echo "Install pysmell"
sudo pip install pysmell

# Install dependencies for development and shell
echo "Install Python 2.7 devel files"
sudo apt-get -y build-dep python2.7

echo "All of the automated stuff is done"
echo "Get  .gitconfig and id files and pull down /bin from github"
echo "Run bootstrap-thinkpad.sh if your computer is a thinkpad"
echo "Run bootstrap-shell.sh for zsh, rvm, nvm, pythonz and run rvm-pythonz-update.sh
to make sure you have the latest versions"
echo "Run bootstrap-vim.sh to setup vim"
echo "You'll want to install skype, vagrant, virtualbox, google chrome, racket, go, and dart from their websites"
