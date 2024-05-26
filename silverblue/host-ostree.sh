#!/usr/bin/env sh

echo "Install apps into the System OS Tree"
echo "" 

sudo rpm-ostree install distrobox htop tilix zsh gnome-tweaks tlp tlp-rdw powertop

echo "Setup Distrobox Display Support"
echo ""

ln -s $PWD/.distroboxrc $HOME/.distroboxrc

echo "" 
echo "" 
echo "Reboot to load the new image"