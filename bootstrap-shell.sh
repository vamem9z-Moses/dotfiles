## Install Development Dependencies
echo "Installing nvm"
curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash

echo "Installing rvm"
curl -sSL https://get.rvm.io | bash -s stable

echo "Install Pythonz"
sudo apt-get -y build-dep python2.7
curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash

echo "Install oh-my-zsh"
curl -L http://install.ohmyz.sh | sh

echo "Change shell to zsh"
chsh /bin/zsh

### Copy Original Files to Old
echo "Move Original Files to originalfile.old"
mv $HOME/.bashrc $HOME/.bashrc.old
mv $HOME/.zshrc $HOME/.zshrc.old

### Create Symbolic Links to dotfiles replacements
echo "Creating Symbolic Links to dotfiles Replacements"
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.bashrc $HOME/.bashrc
