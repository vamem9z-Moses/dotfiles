#!/usr/bin/env sh

mkdir -p $HOME/installed $HOME/Downloads
cd $HOME/Downloads
wget https://github.com/neovim/neovim/archive/refs/tags/stable.tar.gz 
tar zxvf stable.tar.gz 
mv neovim-stable $HOME/installed

cd $HOME/installed/neovim-stable
rm -r build/  # clear the CMake cache
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install

echo "Keep the installed directory to uninstall neovim"
echo "Run 'cmake --build build/ --target uninstall' to uninstall"