# User configuration


PATH="$HOME/Apps:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/games:/usr/local/games:$PATH"

# Pyenv
#export PYENV_ROOT="${HOME}/.pyenv"

#if [ -d "${PYENV_ROOT}" ]; then
#  export PATH="${PYENV_ROOT}/bin:${PATH}"
#  eval "$(pyenv init -)"
#fi

# Pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# RVM
PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# Add all new PATH addtitions above this line

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Go Settings
export NOGOPATH=$PATH
export GOPATH=$HOME/Software/gocode

# Final Path
export PATH=$PATH:$HOME/Apps/go/bin:$GOPATH/bin

# Aliases
alias update-grub-fedora="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias update-grub-fedora-efi="sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg"
alias oracle_mvn="JAVA_HOME=/usr/java/latest mvn"
alias ojava="/usr/java/latest/bin/java"
alias ojavac="/usr/java/latest/bin/javac"
alias create_box="/usr/share/vagrant/gems/gems/vagrant-libvirt-0.0.32/tools/create_box.sh"

# Platform specific configurations

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  platform='darwin'
elif [ -e /etc/redhat-release ]; then
  platform='fedora'
elif [ -e /etc/debian_version ]; then
  platform='ubuntu'
fi

# Add Postgres App Path for mac
#
if [[ $platform == 'darwin' ]]; then
	PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
fi

## Add help for zsh on mac installed with Homebrew
if [ $platform == 'darwin' ]; then
	unalias run-help
	autoload run-help
	HELPDIR=/usr/local/share/zsh/help
fi

# Virtualenv Wrapper Config
export WORKON_HOME=$HOME/.virtualenvs
if [ $platform == 'fedora' ]; then
	source /usr/bin/virtualenvwrapper.sh
fi
if [ $platform == 'ubuntu' ]; then
	source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi
if [ $platform == 'darwin' ]; then
	source /usr/local/bin/virtualenvwrapper.sh
fi

#JAVA_HOME
if  [ $platform == 'ubuntu' ]; then
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi

# Visual Studio Code for Mac
function vscode () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args "$@"; }
