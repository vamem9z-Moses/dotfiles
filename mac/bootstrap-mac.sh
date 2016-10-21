#!/usr/bin/env bash

echo "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Update Homebrew"
brew update

echo "Install Cask"
brew tap caskroom/caskroom

echo "Update After Installing Cask"
brew update

echo "Install Productivity Tools"
brew install gedit vim zsh

echo "Install Utilities"
brew install git git-lfs gpg dnsmasq ctags mercurial shrewsoft-vpn-client virt-manager virt-viewer wget openssl

echo "Install Casks"
brew cask install atom clementine emacs-mc handbrake java lighttable mactex pgadmin3 racket tuntap x2goclient xquartz

echo "Install Virtualenvwrapper"
sudo pip install virtualenvwrapper

echo "Install Nodejs"
brew install nodejs
