#!/usr/bin/env sh
mkdir -p $HOME/Downloads
cd $HOME/Downloads
#wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
wget https://github.com/adobe-fonts/source-code-pro/archive/refs/tags/2.042R-u/1.062R-i/1.026R-vf.zip
if [ ! -d "$HOME/.local/share/fonts" ]; then
  mkdir ~/.local/share/fonts
fi
#unzip 1.050R-it.zip
unzip 1.026R-vf.zip
cp source-code-pro-*-vf/OTF/*.otf $HOME/.local/share/fonts/
rm -rf source-code-pro*
rm 1.026R-vf.zip
cd ~/
fc-cache -f -v $HOME/.local/share/fonts
