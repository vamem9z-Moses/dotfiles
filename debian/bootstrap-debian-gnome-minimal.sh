#!/usr/bin/env sh

echo "Install nala, a better apt frontend"
sudo apt install -y nala dialog

echo "Get the fastest mirror"
sudo nala fetch

echo "Install base gnome environment"
sudo nala install -y gnome-shell gnome-terminal gnome-text-editor firefox-esr nautilus nautilus-extension-gnome-terminal wl-clipboard xclip ffmpegthumbnailer dconf-editor

echo "Install lightdm instead of gdm3 because of a bug with UTM on mac"
sudo nala install -y lightdm

echo "Setup graphical boot -- optional"
echo "To set up graphical boot run the following"
echo "sudo systemctl enable --now lightdm && sudo systemctl set-default graphical.target"
echo "Reboot after the command completes"
