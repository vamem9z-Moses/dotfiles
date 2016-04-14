#/usr/bin/env bash

echo "Install Generic workstation"
./bootstrap-fedora-workstation.sh

echo "Install vdpau support"
sudo dnf install -y mesa-vdpau-drivers vdpauinfo libvdpau-va-gl

echo ""
echo "Install software that only makes sense on actual hardware"

echo "Install HW specific utilities"
sudo dnf install -y powertop tlp smartmontools lm_sensors

echo "Install HW specific apps"
sudo dnf install -y simple-scan xsane lsdvd dvdbackup HandBrake-gui HandBrake-cli makemkv

echo "Install entertainment apps"
sudo dnf install -y clementine kodi xpaint minitube vlc sound-juicer aisleriot


echo "Install Codecs"
sudo dnf install -y gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-bad gstreamer1-plugins-bad-free-extras gstreamer-plugins-ugly gstreamer1-plugins-ugly gstreamer-plugins-good gstreamer1-plugins-good gstreamer-plugins-good-extras gstreamer1-plugins-good-extras gstreamer1-libav gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-base gstreamer1 gstreamer-ffmpeg libdvdcss libdvdread libdvdnav libmad lame

# Setup thermald
echo "Setting up thermald"
sudo dnf copr -y enable hadrons123/thermald
sudo dnf install -y thermal-daemon

sudo systemctl enable thermald
sudo systemctl start thermald

# Setup acpid
echo "Setting up acpid"
sudo dnf install -y acpid

sudo systemctl enable acpid
sudo systemctl start acpid

# Setup skype
echo "Installing Skype"
sudo dnf config-manager -y --add-repo=http://negativo17.org/repos/fedora-skype.repo
sudo dnf install -y skype
