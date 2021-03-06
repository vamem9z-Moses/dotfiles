#!/usr/bin/env bash

### Copy Original Files to Old
echo "Move Original Files to originalfile.old"
mv $HOME/.vimrc $HOME/.vimrc.old
mv $HOME/.vim $HOME/.vim.old

### Create Symbolic Links to dotfiles replacements
echo "Creating Symbolic Links to dotfiles Replacements"
ln -s $PWD/.vim $HOME/.vim
ln -s $PWD/.vimrc $HOME/.vimrc

### Installing Vundle
echo "Installing Vundle"
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing Vim Plugins"
vim +PluginInstall +qall

echo "Install python-mode"
cd ~/.vim/bundle/python-mode && git submodule update --init --recursive

echo "Install YouCompleteMe"
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive
~/.vim/bundle/YouCompleteMe/install.py

echo "Done"
