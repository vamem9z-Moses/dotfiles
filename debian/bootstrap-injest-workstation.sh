#!/usr/bin/env sh

# Bootstrap the correct repos
echo "Bootstrap the correct repos"
./bootstrap-repos.sh

# Set Yama status to 1 to allow secure notes to add files in 1Password
# Check Yama status by running cat /proc/sys/kernel/yama/ptrace_scope in the terminal.  A value of 0 indicates it is unrestricted (causing the error), while 1 indicates it is restricted (required for functionality).
# Restart 1Password if necessary
sudo sysctl -w kernel.yama.ptrace_scope=1 | sudo tee -a /etc/sysctl.conf

# Make sure we are up to date
echo "Update repo"
sudo apt update -y && sudo apt upgrade -y

# Add Utilities
echo "Install utilities"
sudo apt install -y nala zsh git tmux vim python-is-python3 gnome-keyring curl wget gpg fontconfig openssl gettext make cmake htop sqlitebrowser zip unzip

# Install fuse 2 for AppImageLauncher and AppImages
echo "Install fuse 2"
sudo apt install -y install fuse binutils desktop-file-utils libfuse2t64

# Ensure we are using the fastest mirror
echo "Ensure we are using the fastest mirror"
sudo nala fetch

# Add flatpak
echo "Add flatpak"
sudo apt install flatpak gnome-software-plugin-flatpak flatseal
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Add codecs
echo "Add codecs"
sudo apt install -y libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly vlc

# Add Injest Software
echo "Add Injest Software"
sudo apt install -y handbrake

# Add Makemkv
echo "Add Makemkv"
wget -O- ramses.hjramses.com/deb/hjmooses-2025.pgp | gpg --dearmor | tee /etc/apt/keyrings/hjmooses-2025.pgp >/dev/null
wget -O- ramses.hjramses.com/deb/hjmooses-trixie.sources | tee /etc/apt/sources.list.d/hjmooses-trixie.sources
sudo apt update
sudo apt install -y makemkv-oss makemkv-bin

## Add Development Dependencies
echo "Add Development Dependencies"

## Add kernel headers
echo "Add kernel headers"
sudo apt install -y linux-headers-generic

## Add dependencies for sdkman
echo "Add sdkman dependencies"
sudo apt install -y zip unzip

## Add dependencies to build neovim from source
echo "Add neovim build runtime dependencies"
sudo apt install -y gettext make cmake fzf wl-clipboard xclip ripgrep fd-find

## Add dependencies to build ruby
echo "Add ruby build dependencies"
sudo apt install -y autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

## Add dependencies to build python
echo "Add python build dependencies"
sudo apt install -y build-essential zlib1g-dev libbz2-dev libssl-dev libreadline-dev libncurses5-dev libsqlite3-dev libgdbm-dev libdb-dev libexpat-dev libpcap-dev liblzma-dev libpcre3-dev libffi-dev

## Add dependencies for clojure
echo "Add clojure dependencies"
sudo apt install -y rlwrap

# Final Message
echo "Restart the system to fully enable flatpak"
