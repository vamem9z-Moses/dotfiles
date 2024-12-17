#!/usr/bin/env sh

# Make sure we are up to date
echo "Update repo"
sudo dnf update -y --refresh

# Add Utilities
echo "Install utilities"
sudo dnf install -y zsh git tmux vim htop gnome-keyring wget gnupg1 gnupg2 openssl

# Add Development Tools
echo "Install VSCode"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
sudo dnf update -y refresh
sudo dnf install -y code

## Add dependencies to build neovim from source
echo "Add neovim build dependencies"
sudo dnf install -y make cmake gettext fzf

## Add dependencies to build ruby
echo "Add ruby build dependencies"
sudo dnf install -y libxcrypt libxcrypt-devel libxcrypt-compat autoconf gcc rust patch make bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel

## Add dependencies to build python
echo "Add python build dependencies"
sudo dnf install -y zlib-devel bzip2-devel openssl-devel readline-devel ncurses-devel sqlite-devel gdbm-devel db4-devel expat-devel libpcap-devel xz-devel pcre-devel libffi-devel

## Add dependencies for clojure
echo "Add clojure dependencies"
sudo dnf install -y rlwrap

# Podman
echo "Make Podman and Podman-Compose available to apps container"
sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/podman
sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/podman-compose

# Fonts
echo "Make fonts available inside of the container"
fc-cache -f -v
