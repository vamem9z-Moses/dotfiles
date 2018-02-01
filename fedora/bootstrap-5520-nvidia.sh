echo "Setting up nvidia on Dell Precision 5520"
echo "Add negativo17 nvidia repos"
sudo dnf config-manager -y --add-repo=https://negativo17.org/repos/fedora-nvidia.repo
sudo dnf config-manager -y --add-repo=http://negativo17.org/repos/fedora-multimedia.repo

echo "Install nvidia driver"
sudo dnf install -y nvidia-settings nvidia-driver kernel-devel akmod-nvidia dkms acpi

echo "Install 32-bit app support"
sudo dnf install -y vulkan.i686 nvidia-driver-libs.i686

echo "Install bumblebee copr"
sudo dnf copr -y enable chenxiaolong/bumblebee

echo "Install bbswitch, bumblebee and primus"
sudo dnf install -y akmod-bbswitch bumblebee primus

echo "Install cuda"
sudo dnf install -y cuda-devel nvidia-driver-cuda

echo "Add user to bumblebee group"
sudo gpasswd -a $USER bumblebee

echo "Enable bumblebee service and disable fallback"
sudo systemctl enable bumblebeed
sudo systemctl disable nvidia-fallback

echo "All done. All you need to do is reboot. See https://fedoraproject.org/wiki/Bumblebee for more info"



