# User configuration


PATH="$HOME/.local/bin:$HOME/Apps:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/games:/usr/local/games:$PATH"

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
export GOROOT=$HOME/Apps/go
export GOPATH=$HOME/Software/gocode


# Nim Settings
export NIMPATH=$HOME/Apps/nim
export NIMBLEPATH=$HOME/.nimble

# Apache Ignite Settings
export IGNITE_HOME=$HOME/Apps/ignite

#Add Gemset
#Commented out for rvm
#export GEM_HOME=$HOME/.gemsets

# Final Path
export PATH=$GEM_HOME/bin:$GOROOT/bin:$GOPATH/bin:$NIMPATH/bin:$NIMBLEPATH/bin:$PATH


# Aliases
alias update-grub-fedora="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias update-grub-fedora-efi="sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg"
alias oracle_mvn="JAVA_HOME=/usr/java/latest mvn"
alias ojava="/usr/java/latest/bin/java"
alias ojavac="/usr/java/latest/bin/javac"
alias create_box="/usr/share/vagrant/gems/gems/vagrant-libvirt-0.0.32/tools/create_box.sh"

# Project Directory Aliases
alias formanalysis="cd $GOPATH/src/github.com/ATHN/formanalysis"
alias 3rapp="cd $GOPATH/src/github.com/MilesAheadLLC/3rapp"
alias weaven-proj="cd $GOPATH/src/github.com/MilesAheadLLC/weaven"

# Platform specific configurations

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  export platform='darwin'
elif [ -e /etc/centos-release ]; then
  export platform='centos'
elif [ -e /etc/redhat-release ]; then
  export platform='fedora'
elif [ -e /etc/debian_version ]; then
  export platform='ubuntu'
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
if [ $platform == 'fedora' ] || [ $platform == 'centos' ]; then
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
	export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv-3
	export VIRTUALENVWRAPPER_VIRTUALENV_CLONE=/usr/bin/virtualenv-clone-3
	source /usr/bin/virtualenvwrapper.sh
fi
if [ $platform == 'ubuntu' ]; then
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
	export VIRTUALENVWRAPPER_VIRTUALENV_CLONE=$HOME/.local/bin/virtualenv-clone
	export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/virtualenv
	source $HOME/.local/bin/virtualenvwrapper.sh
fi
if [ $platform == 'darwin' ]; then
	source $HOME/Library/Python/3.6/bin/virtualenvwrapper.sh
fi

#JAVA_HOME
if  [ $platform == 'ubuntu' ]; then
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi

#Set enable dev tools for centos vm
#from gist - https://gist.github.com/puremourning/a41b4c6ac732091f63736e3ccb6d8d67
if [ -f /opt/rh/devtoolset-6/enable ]; then
	source /opt/rh/devtoolset-6/enable
fi

# Centos specific configs
if [ $platform == 'centos' ]; then
	export IBUS_ENABLE_SYNC_MODE=1
fi
