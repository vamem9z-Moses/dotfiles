#!/usr/bin/env sh

echo "Setting up nvidia"

echo "Install nvidia driver"
sudo dnf install -y nvidia-settings nvidia-driver kernel-devel akmod-nvidia dkms acpi

echo "Install 32-bit app support"
sudo dnf install -y vulkan.i686 nvidia-driver-libs.i686

echo "Install cuda"
sudo dnf install -y cuda-devel nvidia-driver-cuda

echo "All done. All you need to do is reboot. See https://fedoraproject.org/wiki/Bumblebee for more info"
