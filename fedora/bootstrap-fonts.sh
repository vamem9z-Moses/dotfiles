#!/usr/bin/env bash

echo "Start install"
sudo mkdir -p /usr/share/fonts/monaco

echo "Copying Font"
sudo cp ../fonts/Monaco_Linux.ttf /usr/share/fonts/monaco

echo "Installing font"
cd /usr/share/fonts/monaco
sudo chmod 644 Monaco_Linux.ttf
sudo mkfontscale
sudo mkfontdir

echo "Leaving Font Directory"
cd -

echo "Enjoy"
