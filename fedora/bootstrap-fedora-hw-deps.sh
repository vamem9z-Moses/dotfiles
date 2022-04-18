#!/usr/bin/env sh

echo ""
echo "Install software that only makes sense on actual hardware"
echo "Install vdpau support"

sudo dnf install -y mesa-vdpau-drivers vdpauinfo libvdpau-va-gl libva-vdpau-driver

echo "Install HW specific utilities"
sudo dnf install -y powertop smartmontools lm_sensors

echo "Install HW specific apps"
sudo dnf install -y simple-scan xsane lsdvd dvdbackup smplayer
sudo flatpak install -y flathub com.hamrick.VueScan

echo "Install virtualization tools" 
sudo dnf install -y virt-manager libvirt qemu vagrant*

echo "Setup thermald"
sudo dnf install -y thermald
sudo systemctl enable thermald
sudo systemctl start thermald
