#!/usr/bin/env sh


echo ""
echo "Install software that only makes sense on actual hardware"

echo "Install App from fedora-multimedia"
sudo dnf install -y HandBrake-gui HandBrake-cli --allowerasing

echo "Install entertainment apps"
sudo dnf install -y clementine kodi vlc vlc-extras sound-juicer aisleriot

echo "Install Codecs"
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel --skip-broken --allowerasing

sudo dnf install -y lame\* --exclude=lame-devel

sudo dnf group upgrade -y --with-optional Multimedia

echo "Install MakeMKV"
sudo flatpak install -y flathub com.makemkv.MakeMKV

echo "Install libdvdcss"
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y libdvdcss
