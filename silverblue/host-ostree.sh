#!/usr/bin/env sh

echo "Install apps into the System OS Tree"
echo "" 

sudo rpm-ostree install distrobox htop tilix zsh gnome-tweaks lm_sensors powertop podman-compose

echo "Set inotify watchers to higher limit for distrobox"
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

echo "" 
echo "" 
echo "Reboot to load the new image"