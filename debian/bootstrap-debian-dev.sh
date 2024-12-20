#!/usr/bin/env sh

# Make sure we are up to date
echo "Update repo"
sudo apt update -y && sudo apt upgrade -y

# Add Utilities
echo "Install utilities"
sudo apt install -y nala zsh git tmux vim python-is-python3 gnome-keyring wget gpg fontconfig openssl software-properties-common gettext make cmake htop sqlitebrowser

# Ensure we are using the fastest mirror
sudo nala fetch

# Add Development Tools
echo "Install VSCode"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
rm -f packages.microsoft.gpg
sudo nala install -y apt-transport-https
sudo nala update
sudo nala install -y code # or code-insiders

## Add dependencies to build neovim from source
echo "Add neovim build runtime dependencies"
sudo nala install -y gettext make cmake fzf wl-clipboard xclip

## Add dependencies to build ruby
echo "Add ruby build dependencies"
sudo nala install -y autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

## Add dependencies to build python
echo "Add python build dependencies"
sudo nala install -y build-essential zlib1g-dev libbz2-dev libssl-dev libreadline-dev libncurses5-dev libsqlite3-dev libgdbm-dev libdb-dev libexpat-dev libpcap-dev liblzma-dev libpcre3-dev libffi-dev

## Add dependencies for clojure
echo "Add clojure dependencies"
sudo nala install -y rlwrap
