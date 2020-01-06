#!/usr/bin/env bash

echo "Setup emacs to use spaceemacs"

echo "Backing up old emacs and spaceemacs"
mv $HOME/.emacs.d $HOME/.emacs.d.bak
mv $HOME/.spacemacs $/HOME/.spacemacs.old
mv $HOME/.emacs $/HOME/.emacs.old

echo "Setting up new spaceemacs install"
ln -s $PWD/.spacemacs $HOME/.spacemacs
git clone --recursive https://github.com/syl20bnr/spacemacs $HOME/.emacs.d

echo "Install tern binary"
sudo npm install -g tern

echo "Install tools required for clojure support"
./bootstrap-clojure-tools.sh

echo "Install tools for python support"
echo "Install python language-server"
pip install --user python-language-server flake8 autoflake "ptvsd>=4.2" isort importmagic epc yapf 

echo "Spacemacs is installed, to complete installation of packages run emacs"
