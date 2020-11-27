## Install Development Dependencies
echo "Create gemset directory"
mkdir $HOME/.gemsets

echo "Installing nvm"
curl https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash

echo "Installing rvm"
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

echo "Install Pythonz"
curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash

echo "Install oh-my-zsh"
curl -L http://install.ohmyz.sh | sh

echo "Change shell to zsh"
chsh -s /bin/zsh

### Copy Original Files to Old
echo "Move Original Files to originalfile.old"
mv $HOME/.bashrc $HOME/.bashrc.old
mv $HOME/.zshrc $HOME/.zshrc.old
mv $HOME/.zshenv $HOME/.zshenv.old
mv $HOME/.ctags $HOME/.ctags.old

### Create Symbolic Links to dotfiles replacements
echo "Creating Symbolic Links to dotfiles Replacements"
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.zshenv $HOME/.zshenv
ln -s $PWD/.bashrc $HOME/.bashrc
ln -s $PWD/.ctags $HOME/.ctags
