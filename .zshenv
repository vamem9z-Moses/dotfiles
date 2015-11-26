# User configuration


PATH="$HOME/Apps:$HOME/bin:$PATH:/usr/games:/usr/local/games"

# Pyenv
#export PYENV_ROOT="${HOME}/.pyenv"

#if [ -d "${PYENV_ROOT}" ]; then
#  export PATH="${PYENV_ROOT}/bin:${PATH}"
#  eval "$(pyenv init -)"
#fi

#export PATH

# Pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# Groovy
GROOVY_HOME=/home/mmiles/Apps/groovy-2.2.2
PATH=$PATH:$GROOVY_HOME/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# Add all new PATH addtitions above this line
export NOGOPATH=$PATH

# Go
export GOROOT=$HOME/Apps/go
export GOPATH=$HOME/Software/gocode
PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Aliases
alias 3rapp="source $HOME/Software/ma/3rapp/src/github.com/MilesAheadLLC/3rapp/bin/3rapp"
alias 3rappweb="source $HOME/Software/ma/3rappweb/src/github.com/MilesAheadLLC/3rappweb/bin/3rappweb"
alias formanalysis="source $HOME/Software/ATHN/formanalysis/setgopath"
alias update-grub-fedora="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias update-grub-fedora-efi="sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg"
alias oracle_mvn="JAVA_HOME=/usr/java/jdk1.8.0_51 mvn"

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
