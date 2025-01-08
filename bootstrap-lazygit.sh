#!/usr/bin/env bash

go_version = ""

go_install_intro='LazyGit is installed from source and requires an up to date version of go.
Mise is used to install and manage the version number and will install a globally available version of go.'

re='^[0-9]+(\.[0-9]+)*$'

install_dir = $HOME/installed/

function get_go_ver() {
  if [[ $go_version =~ $re ]]; then
    echo $go_install_intro
    echo " "
    read -p 'Enter Golang Version Number: ' go_version
  else
    echo "'$version' must be a valid version number"
    exit 1
  fi
}

function setup_install_dirs() {
  mkdir -p install_dir
  cd install_dir
}

function install_go() {
  if [[ -e $HOME/.local/bin/mise ]]; then
    mise install "go@$go_version"
    mise use -g "go@$go_version"
  else
    echo "Mise is missing from the PATH. Please install mise or add it to the path."
    exit 1
  fi
}

function install_lazygit() {
  git clone https://github.com/jesseduffield/lazygit.git
  cd lazygit
  go install
  echo "LazyGit is installed and ready to use to use it enter lazygit inside a git repository"
}

if ! command -v go 2>&1 >/dev/null; then
  get_go_ver
  install_go
fi

setup_install_dirs
install_lazygit
