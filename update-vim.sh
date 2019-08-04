#/usr/bin/env bash

echo  "Updating Vim Plugins"
vim +PluginUpdate +qall

echo "Update python-mode"
cd ~/.vim/bundle/python-mode && git submodule update --init --recursive

echo "Update YouCompleteMe"
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive
~/.vim/bundle/YouCompleteMe/install.py

echo "Done"
