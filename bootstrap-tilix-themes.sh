#!/usr/bin/env sh

echo "Download TokyoNight Themes"

mkdir -p $HOME/Software/thirdparty/
cd $HOME/Software/thirdparty/
git clone https://github.com/kevontheweb/tokyo-night-tilix-black-box-theme.git

echo "Install TokyoNight Themse"

mkdir -p $HOME/.config/tilix/schemes/
cp $HOME/Software/thirdparty/tokyo-night-tilix-black-box-theme/*.json $HOME/.config/tilix/schemes/

echo "Select the tokyonight theme in tilix > preferences > profile"
