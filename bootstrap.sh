#!/usr/bin/env bash

## Install Development Dependencies
echo "Installing nvm"
curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash

echo "Installing pythonz"
curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash

echo "Installing rvm"
curl -sSL https://get.rvm.io | bash -s stable

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

### Installing Vundle
echo "Installing Vundle"
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing Vim Plugins"
vim +PluginInstall +qall

echo "Install YouCompleteMe"
cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

echo "Done"
