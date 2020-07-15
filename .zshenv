# User configuration


PATH="$HOME/.npm-global/$HOME/.local/bin:$HOME/Apps:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/games:/usr/local/games:$PATH"

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

# Rust Settings
export CARGOPATH=$HOME/.cargo

# Nim Settings
export NIMPATH=$HOME/Apps/nim
export NIMBLEPATH=$HOME/.nimble

# Apache Ignite Settings
export IGNITE_HOME=$HOME/Apps/ignite

#Add Gemset
#Commented out for rvm
#export GEM_HOME=$HOME/.gemsets

# Final Path
export PATH=$CARGOPATH/bin:$GEM_HOME/bin:$GOROOT/bin:$GOPATH/bin:$NIMPATH/bin:$NIMBLEPATH/bin:$PATH


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

# Clean Python Files Alias
alias pyclean='find . -name "*.py[c|o]" -o -name __pycache__ -exec rm -rf {} +'

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
	PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/postgresql@9.6/bin:$PATH
fi

## Add help for zsh on mac installed with Homebrew
if [[ $platform == 'darwin' ]]; then
	unalias run-help
	autoload run-help
	HELPDIR=/usr/local/share/zsh/help
fi

## Add Openssl, zlib, gettext, sqlite, readline and ruby config locations on Mac from Homebrew
## For this to work must install homebrew and run
## brew install ruby zlib openssl gettext sqlite readline libffi
## gettext is needed to fix vim
if [[ $platform == 'darwin' ]]; then
	export PATH="/Users/moses/Library/Python/3.7/bin:/usr/local/opt/gettext/bin:/usr/local/opt/ruby/bin:$PATH"
	export LDFLAGS="-L/usr/local/opt/gettext/lib -L/usr/local/opt/openssl/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/ruby/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/libffi/lib"
  	export CPPFLAGS="-I/usr/local/opt/gettext/include -I/usr/local/opt/openssl/include -I/usr/local/opt/zlib/include -I/usr/local/opt/ruby/include -I/usr/local/opt/sqlite/include -I/usr/local/opt/readline/include"
  	export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig:/usr/local/opt/sqlite/lib/pkgconfig:/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig:/usr/local/opt/libffi/lib/pkgconfig"
fi

# Virtualenv Wrapper Config
export WORKON_HOME=$HOME/.virtualenvs
if [[ $platform == 'fedora' ]] || [[ $platform == 'centos' ]]; then
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
	export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv-3
	export VIRTUALENVWRAPPER_VIRTUALENV_CLONE=/usr/bin/virtualenv-clone-3
	source /usr/bin/virtualenvwrapper-3.sh
fi
if [[ $platform == 'ubuntu' ]]; then
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
	export VIRTUALENVWRAPPER_VIRTUALENV_CLONE=/usr/bin/virtualenv-clone
	export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
	source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

#JAVA_HOME
if  [[ $platform == 'ubuntu' ]]; then
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi

#Set enable dev tools for centos vm
#from gist - https://gist.github.com/puremourning/a41b4c6ac732091f63736e3ccb6d8d67
if [ -f /opt/rh/devtoolset-6/enable ]; then
	source /opt/rh/devtoolset-6/enable
fi

# Centos specific configs
if [[ $platform == 'centos' ]]; then

	export IBUS_ENABLE_SYNC_MODE=1
fi

