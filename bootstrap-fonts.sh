#!/usr/bin/env sh

./bootstrap-source-code-pro-fonts.sh
./bootstrap-wps-fonts.sh

# Fonts
echo "Copy fonts to $HOME/.fonts"
mkdir -p $HOME/.fonts
cp -R fonts/* $HOME/.fonts/

fc-cache -f -v