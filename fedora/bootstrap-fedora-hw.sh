#/usr/bin/env bash

echo "Install Generic workstation"
./bootstrap-fedora-workstation.sh

echo "Install vdpau support"
sudo dnf install -y mesa-vdpau-drivers vdpauinfo libvdpau-va-gl libva-vdpau-driver

echo ""
echo "Install software that only makes sense on actual hardware"

echo "Install HW specific utilities"
sudo dnf install -y powertop smartmontools lm_sensors

echo "Install HW specific apps"
sudo dnf install -y simple-scan xsane lsdvd dvdbackup smplayer

echo "Install App from fedora-multimedia"
sudo dnf install -y HandBrake-gui HandBrake-cli makemkv libdvdcss --allowerasing

echo "Install entertainment apps"
sudo dnf install -y clementine kodi vlc sound-juicer aisleriot

echo "Install dropbox"
sudo dnf install -y nautilus-dropbox dropbox

echo "Install virtualization tools"
sudo dnf install -y virt-manager libvirt qemu* vagrant*

echo "Install Codecs"
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel

sudo dnf install -y lame\* --exclude=lame-devel

sudo dnf group upgrade -y --with-optional Multimedia

# Setup thermald
sudo dnf install -y thermald
sudo systemctl enable thermald
sudo systemctl start thermald
