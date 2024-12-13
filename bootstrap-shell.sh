# Install Development Dependencies

## Install uv for Python
curl -LsSf https://astral.sh/uv/install.sh | sh

## Install SDKMAN for Java
curl -s "https://get.sdkman.io" | bash

## Install MISE for all other languages

curl https://mise.run | sh


## "Install OH MY ZSH and Oh My Zsh Theme"
echo "Install oh-my-zsh"
curl -L http://install.ohmyz.sh | sh

echo "Create Symbolic Links to dotfile custom Oh My Zsh Theme"

## Adds support to id distrobox containers by their container name
ln -s $PWD/oh-my-zsh/agnoster.zsh-theme $HOME/.oh-my-zsh/custom/themes/agnoster.zsh-theme

echo "Change shell to zsh"
chsh -s /bin/zsh

# Set up environment files

## Copy Original Files to Old
echo "Move Original Files to originalfile.old"
mv $HOME/.bashrc $HOME/.bashrc.old
mv $HOME/.zshrc $HOME/.zshrc.old
mv $HOME/.zshenv $HOME/.zshenv.old
mv $HOME/.ctags $HOME/.ctags.old

## Create Symbolic Links to dotfiles replacements
echo "Creating Symbolic Links to dotfiles Replacements"
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.ctags $HOME/.ctags
ln -s $PWD/.distroboxrc $HOME/.distroboxrc
