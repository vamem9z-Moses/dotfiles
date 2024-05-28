#!/usr/bin/env sh

# Update
echo "Update Computer"

sudo apt update
sudo apt -y upgrade

# Install Utilities
echo "Install Utilities"
sudo apt install -y git vim htop tree wget unzip curl zsh mercurial exuberant-ctags cmake unrar-free gpgv2 rlwrap

# Install Development Platform
echo "Install Development Platform"
sudo apt install -y python3-pip virtualenvwrapper pipx pylint

# Install dependencies for development and shell
echo "Install Python devel files for pythonz"
sudo apt -y build-dep python3

# Install Development Dependencies
sudo apt install -y libreadline-dev build-essential

# Fix Tilix VTE issue
ln -s /etc/profile.d/vte-219.sh /etc/profile.d/vte.sh

echo " "
echo " "
echo " "
echo "All of the automated stuff is done"
echo " "
echo "if you are using wsl2 and have not done this already update the /etc/wsl.conf use the example file as a guide" 
echo " "
echo "Get .gitconfig and id files and pull down /bin from github"
echo " "
echo "Run bootstrap-shell.sh for zsh, rvm, nvm, pythonz and run rvm-pythonz-update.sh
to make sure you have the latest versions"
echo " " 
echo "Run bootstrap-vim.sh to setup vim"