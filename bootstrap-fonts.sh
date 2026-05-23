#!/usr/bin/env sh

./bootstrap-source-code-pro-fonts.sh
./bootstrap-wps-fonts.sh

# Fonts
echo "Copy fonts to $HOME/.local/share/fonts - need to there for flatpak"
if [ ! -d "$HOME/.local/share/fonts" ]; then
  mkdir ~/.local/share/fonts
fi
cp -R fonts/* $HOME/.local/share/fonts

fc-cache -f -v $HOME/.local/share/fonts
