#!/usr/bin/env bash

### Copy Original Files to Old
echo "Move Original Files to originalfile.old"
mv $HOME/.bashrc $HOME/.bashrc.old
mv $HOME/.zshrc $HOME/.zshrc.old
mv $HOME/.vimrc $HOME/.vimrc
mv $HOME/.vim $HOME/.vim.old

### Create Symbolic Links to dotfiles replacements
echo "Creating Symbolic Links to dotfiles Replacements"
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.bashrc $HOME/.bashrc
ln -s $PWD/.vim $HOME/.vim
ln -s $PWD/.vimrc $HOME/.vimrc

echo "Done"
