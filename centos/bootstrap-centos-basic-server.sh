echo "Update System"
sudo yum update -y

echo "Add basic system files"
sudo yum install -y vim lm_sensors epel-release tree lshw

echo "Update to get latest epel-release"
sudo yum update -y

echo "Install htop"
sudo yum install -y htop thermald

echo "Install cockpit"
sudo yum install -y cockpit-packagekit cockpit-networkmanager cockpit-storaged cockpit-dashboard cockpit-docker

echo "Running Sensors Detect"
sudo sensors-detect
