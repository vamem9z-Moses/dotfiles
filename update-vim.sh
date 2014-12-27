#/usr/bin/env bash

echo  "Updating Vim Plugins"
vim +PluginUpdate +qall

echo "update You YouCompleteMe"
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

echo "Done"
