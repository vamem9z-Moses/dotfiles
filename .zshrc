#Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

source $ZSH/lib/git.zsh

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
#
BASE_PATH=$HOME/.local/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/games:/usr/local/games:$PATH

# Go Settings
export GOPATH=$HOME/Software/gocode

# Add Go to PATH
export PATH=$GOPATH/bin:$BASE_PATH

# Aliases
alias update-grub-fedora="sudo grub2-mkconfig -o /etc/grub2.cfg"
alias update-grub-fedora-efi="sudo grub2-mkconfig -o /etc/grub2-efi.cfg"

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

# Virtualenv Wrapper Config
export WORKON_HOME=$HOME/.virtualenvs
if [[ $platform == 'fedora' ]] && [[ -f /usr/bin/virtualenv-3 ]]; then
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
	export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv-3
	export VIRTUALENVWRAPPER_VIRTUALENV_CLONE=/usr/bin/virtualenv-clone-3
	source /usr/bin/virtualenvwrapper-3.sh
fi

if [[ $platform == 'ubuntu' ]] && [[ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]]; then
	export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
	export VIRTUALENVWRAPPER_VIRTUALENV_CLONE=/usr/bin/virtualenv-clone
	export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
	source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

# Begin added by ansible argcomplete
if [ -f /home/mmiles/.local/pipx/venvs/ansible/lib/python3.11/site-packages/argcomplete/bash_completion.d ]; then 
	fpath=( /home/mmiles/.local/pipx/venvs/ansible/lib/python3.11/site-packages/argcomplete/bash_completion.d "${fpath[@]}" )
fi
# End added by argcomplet

# Add linux brew to path 
if [[ $platform == 'fedora' ]]; then 
  export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
fi

# Fix Tilix config
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
   if [[ -f /etc/profile.d/vte.sh ]]; then
        source /etc/profile.d/vte.sh
   fi 
fi

# Set 256 Colors for Vim
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
if [[ -d $HOME/.sdkman ]]; then 
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi 

if [[ -e /home/mmiles/miniconda3/bin ]]; then
# >>> conda initialize >>>
 !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mmiles/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mmiles/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mmiles/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH"/home/mmiles/miniconda3/bin:$PATH"

    fi
 fi
unset __conda_setup
# <<< conda initialize <<<
fi

# UV 
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# MISE
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
  eval "$($HOME/.local/bin/mise activate zsh --shims)"
else
  eval "$($HOME/.local/bin/mise activate zsh)"
fi

# Update set editor for use with bundler 
export BUNDLER_EDITOR="nvim"
