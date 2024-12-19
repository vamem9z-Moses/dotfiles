#!/usr/bin/env sh

echo "Install nala, a better apt frontend"
sudo apt -y install nala dialog

echo "Get the fastest mirror"
sudo nala fetch

echo "Install base gnome environment"
sudo nala -y install gnome-shell gnome-terminal gnome-text-editor firefox-esr: nautilus nautilus-extension-gnome-terminal wl-clipboard xclip ffmpegthumbnailer dconf-editor

echo "Install lightdm instead of gdm3 because of a bug with UTM on mac"
sudo nala -y install lightdm

echo "Setup graphical boot"
sudo systemctl enable --now lightdm && sudo systemctl set-default graphical.target

echo "Update /etc/NetworkManager/NetworkManager.conf and changes managed=false to managed=true and then reboot 'sudo reboot'"

# conf file
network_manager_config_file = "/etc/NetworkManager/NetworkManager.conf"

# backup the config file
sudo cp "network_manager_config_file" "network_manager_config_file.bak"

# value to search for
search_string="managed=false"

# value to replace with
replace_string="managed=true"

# replace value with sed
sed -i "s/$search_string/$replace_string/g" "network_manager_config_file"

echo "Rebooting in 5 seconds"

sleep 5
sudo reboot
