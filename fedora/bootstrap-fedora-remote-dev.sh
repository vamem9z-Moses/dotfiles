#!/usr/bin/env bash

echo "Turn on fastest mirror"
sudo echo fastestmirror=true | sudo tee -a /etc/dnf/dnf.conf

echo "Update System"
sudo dnf update -y --refresh

echo "Install basic tools"
sudo dnf -y install htop vim git zsh xorg-x11-xauth

echo "Install Development Tools"
sudo dnf install -y emacs gcc-c++ cmake ctags vim-pysmell vim-enhanced gitg mercurial ctags ctags-etags cmake sbcl nodejs cmake automake gcc gcc-c++ postgresql-server postgresql-contrib uncrustify

echo "Install Development Libraries"
sudo dnf install -y glibc-devel.x86_64 postgresql-devel

echo "Install Python 3 devel files"
sudo dnf install -y python3-devel python3-pip python3

echo "Install Python libraries"
sudo dnf install python-autopep8 python3-autopep8 python3-virtualenvwrapper -y

echo "Install Additional Fonts"
sudo dnf install -y cabextract xorg-x11-font-utils fontconfig google-droid* google-roboto-fonts google-roboto-condensed-fonts

# Install mscorefonts
sudo rpm -ivh https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm 
