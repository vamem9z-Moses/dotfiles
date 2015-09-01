#Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
DEFAULT_USER=mmiles
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python)

source $ZSH/oh-my-zsh.sh

# User configuration


PATH="$PATH:$HOME/Apps:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

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

## The last thing we will do is export the PATH to make sure we got all of the changes

# Set 256 Colors for Vim
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

# Aliases
alias 3rapp="source $HOME/Software/ma/3rapp/src/github.com/MilesAheadLLC/3rapp/bin/3rapp"
alias 3rappweb="source $HOME/Software/ma/3rappweb/src/github.com/MilesAheadLLC/3rappweb/bin/3rappweb"
alias formanalysis="source $HOME/Software/ATHN/formanalysis/setgopath"
alias update-grub-fedora="sudo grub2-mkconfig -o /boot/grub2/grub.cfg"
alias update-grub-fedora-efi="sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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

#JAVA_HOME
if  [ $platform == 'ubuntu' ]; then
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi
