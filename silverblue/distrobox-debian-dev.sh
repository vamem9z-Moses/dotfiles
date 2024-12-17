#!/usr/bin/env sh

# Make sure we are up to date
echo "Update repo"
sudo apt -y update && sudo apt -y upgrade

# Add Utilities
echo "Install utilities"
sudo apt -y install zsh git tmux vim python-is-python3 gnome-keyring wget gpg fontconfig openssl software-properties-common gettext make cmake

# Add Development Tools
echo "Install VSCode"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
rm -f packages.microsoft.gpg
sudo apt -y install apt-transport-https
sudo apt update
sudo apt -y install code # or code-insiders

## Add dependencies to build neovim from source
echo "Add neovim build dependencies"
sudo apt install -y gettext make cmake fzf

## Add dependencies to build ruby
echo "Add ruby build dependencies"
sudo apt -y install autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

## Add dependencies to build python
echo "Add python build dependencies"
sudo apt -y install build-essential zlib1g-dev libbz2-dev libssl-dev libreadline-dev libncurses5-dev libsqlite3-dev libgdbm-dev libdb-dev libexpat-dev libpcap-dev liblzma-dev libpcre3-dev libffi-dev

## Add dependencies for clojure
echo "Add clojure dependencies"
sudo apt -y install rlwrap

# Podman
echo "Make Podman and Podman-Compose available to apps container"
sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/podman
sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/podman-compose

# Fonts
echo "Make fonts available inside of the container"
fc-cache -f -v

