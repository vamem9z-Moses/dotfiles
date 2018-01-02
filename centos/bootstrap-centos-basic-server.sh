echo "Update System"
sudo yum update -y

echo "Add basic system tools"
sudo yum install -y vim lm_sensors epel-release tree lshw pciutils net-tools

echo "Update to get latest epel-release"
sudo yum update -y

echo "Install htop"
sudo yum install -y htop thermald ntp

echo "Install cockpit"
sudo yum install -y cockpit-packagekit cockpit-networkmanager cockpit-storaged cockpit-dashboard cockpit-docker

echo "Setup Time"
sudo timedatectl set-timezone America/New_York
sudo systemctl enable ntpd
sudo systemctl start ntpd

echo "Running Sensors Detect"
sudo sensors-detect
