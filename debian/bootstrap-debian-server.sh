#!/bin/sh

echo "Update apt and upgrade"
sudo apt update && sudo apt upgrade -y

echo "Install basic tools"
sudo apt install -y curl wget htop vim smartmontools lm-sensors firmware-linux git tree lshw

echo "Run Sensors Detect"
sudo sensors-detect
