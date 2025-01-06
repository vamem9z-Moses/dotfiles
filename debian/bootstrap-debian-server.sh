!# /bin/sh

echo "Update apt and upgrade"
sudo apt update && sudo apt upgrade -y

echo "Install basic tools"
sudo apt install -y curl wget htop vim smartmontools lm-sensors powertop firmware-linux git

echo "Run Sensors Detect"
sudo sensors-detect

echo "Setup Powertop"
sudo system enable --now powertop
