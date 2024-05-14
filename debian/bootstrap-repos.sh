#!/usr/bin/env sh

echo "Add repos to sources.list"
sudo echo "deb-src http://deb.debian.org/debian bookworm main" | sudo tee -a /etc/apt/sources.list
sudo echo "deb-src http://deb.debian.org/debian bookworm-updates main" | sudo tee -a /etc/apt/sources.list
sudo echo "deb-src http://security.debian.org/debian-security bookworm-security main" | sudo tee -a /etc/apt/sources.list