# User configuration

BASE_PATH="$HOME/.local/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/games:/usr/local/games:$PATH"

# Pythonz
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# RVM
RVM_PATH="$HOME/.rvm/bin" # Add RVM to PATH for scripting
# Add all new PATH addtitions above this line

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Go Settings
export NOGOPATH=$PATH
export GOPATH=$HOME/Software/gocode

# Final Path
export PATH=$RVM_PATH:$BASE_PATH:$GOPATH/bin

# Aliases
alias update-grub-fedora="sudo grub2-mkconfig -o /etc/grub2.cfg"
alias update-grub-fedora-efi="sudo grub2-mkconfig -o /etc/grub2-efi.cfg"
alias create_box="/usr/share/vagrant/gems/gems/vagrant-libvirt-0.0.32/tools/create_box.sh"

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
