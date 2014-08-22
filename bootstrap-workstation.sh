#!/usr/bin/env bash

# Update
echo "Update Computer"

sudo apt-get update
sudo apt-get -y upgrade

# Install Basics
echo "Install Basics"

sudo apt-get install -y git vim gedit build-essential aptitude lm-sensors htop tree

# Install Power Management
echo "Install Power Management"

sudo add-apt-repository -y ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install -y tlp tlp-rdw powertop

# Remove Stuff I don't use
echo "Remove Apps I don't Use"
sudo apt-get remove -y gnumeric abiword

# Install Applications
echo "Install Apps"
sudo apt-get install -y okular okular-extra-backends aisleriot ctags cmake libpython2.7-dev virtualenvwrapper curl libreadline-dev zsh konsole unrar rar ttf-mscorefonts-installer libreoffice gstreamer0.10-plugins-ugly libxine1-ffmpeg gxine mencoder libdvdread4 totem-mozilla icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 libavcodec-extra openjdk-7-jdk vlc clementine wine nautilus-dropbox firewalld firewall-applet chromium-browser filezilla gdebi

echo "Install CSS"
sudo /usr/share/doc/libdvdread4/install-css.sh

## Install Development Dependencies
echo "Installing nvm"
curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash

echo "Installing rvm"
curl -sSL https://get.rvm.io | bash -s stable

echo "Install Pythonz"
sudo apt-get build-dep python2.7
curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash

echo "Install oh-my-zsh"
curl -L http://install.ohmyz.sh | sh

# Install pysmell
echo "Install pysmell"
sudo pip install pysmell

echo "All of the automated stuff is done"
echo "Get  .gitconfig and id files and pull down /bin and /dotfiles from github"
echo "Run bootstrap-thinkpad.sh if your computer is a thinkpad"
echo "You'll want to install skype, vagrant, virtualbox, google chrome, racket, go, and dart from their websites"