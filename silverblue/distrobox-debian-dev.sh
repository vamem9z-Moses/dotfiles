#!/usr/bin/env sh

echo "Update repo"
echo "" 

sudo apt -y update 
sudo apt -y upgrade

echo "Install utilities"
echo ""

sudo apt -y install zsh git tmux vim rlwrap