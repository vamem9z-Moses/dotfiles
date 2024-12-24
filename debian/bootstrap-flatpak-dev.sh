#!/usr/bin/env sh

echo "Install Flatpak"
sudo nala install -y flatpak gnome-software-plugin-flatpak

echo "Install Flathub"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Install DBeaver"
flatpak install flathub io.dbeaver.DBeaverCommunity

echo "You'll need to restart the session for any flatpak to show up in the menu"
