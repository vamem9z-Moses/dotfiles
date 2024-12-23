#!/usr/bin/env bash

go_version = ""

function install_lazygit() {
  if [[ -e $HOME/.local/bin/mise ]]; then
    mise install "go@$go_version"
    mise use -g "go@go_version"
    mkdir $HOME/installed
    cd $HOME/installed
    git clone https://github.com/jesseduffield/lazygit.git
    cd lazygit
    go install
    echo "LazyGit is installed and ready to use to use it enter lazygit inside a git repository"
  else
    echo "Mise is missing from the PATH. Please install mise or add it to the path."
  fi
}

intro='LazyGit is installed from source and requires an up to date version of go.
Mise is used to install and manage the version number and will install a globally available version of go.'

echo "$intro"
echo " "

read -p 'Enter Golang Version Number: ' go_version

re='^[0-9]+(\.[0-9]+)*$'
if [[ $go_version =~ $re ]]; then
  install_lazygit
else
  echo "'$version' must be a valid version number"
fi
