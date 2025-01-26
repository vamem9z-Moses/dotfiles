#!/bin/sh

echo "Update apt and upgrade"
sudo apt update && sudo apt upgrade -y

echo "Install basic tools"
sudo apt install -y rsync curl wget htop vim smartmontools lm-sensors firmware-linux git tree lshw powertop

echo "Run Sensors Detect"
sudo sensors-detect
