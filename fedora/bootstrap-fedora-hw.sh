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
sudo dnf install -y simple-scan xsane lsdvd dvdbackup

echo "Install App from fedora-multimedia"
sudo dnf install -y HandBrake-gui HandBrake-cli makemkv libdvdcss --allowerasing

echo "Install entertainment apps"
sudo dnf install -y clementine kodi vlc sound-juicer aisleriot

echo "Install dropbox"
sudo dnf install -y nautilus-dropbox nemo-dropbox dropbox

echo "Install virtualization tools"
sudo dnf install -y virt-manager libvirt qemu* vagrant*

echo "Install Codecs"
sudo dnf install -y gstreamer1-libav gstreamer1-plugins-bad-nonfree gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-bad gstreamer1-plugins-bad-free-extras gstreamer-plugins-ugly gstreamer1-plugins-ugly gstreamer-plugins-good gstreamer1-plugins-good gstreamer-plugins-good-extras gstreamer1-plugins-good-extras gstreamer1-libav gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-base gstreamer1 gstreamer-ffmpeg libdvdread libdvdnav libmad lame

sudo dnf install -y gstreamer{1,}-{plugin-crystalhd,ffmpeg,plugins-{good,ugly,bad{,-free,-nonfree,-freeworld,-extras}{,-extras}}} libmpg123 lame-libs --setopt=strict=0

echo "Use Fedora mpeq mp3 support"
sudo dnf remove -y gstreamer1-plugins-ugly

sudo dnf install -y gstreamer1-plugin-mpg123 mpg123-libs

# Setup thermald
sudo dnf install -y thermald
sudo systemctl enable thermald
sudo systemctl start thermald
