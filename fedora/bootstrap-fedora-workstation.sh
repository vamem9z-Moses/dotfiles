#!/usr/bin/env bash

echo "Update System"
sudo dnf update -y

# Install Repos
echo "Adding Repos livna, rpmfusion, fedora-handbrake"

sudo dnf config-manager -y --add-repo=http://negativo17.org/repos/fedora-handbrake.repo
sudo dnf install -y --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Add google repository key"
wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O $HOME/linux_signing_key.pub
sudo rpm --import $HOME/linux_signing_key.pub

echo "Install Development Tools"

sudo dnf group install "Development Tools" -y
sudo dnf install kernel-devel kernel-headers -y

echo "Install vdpau support"
sudo dnf install mesa-vdpau-drivers vdpauinfo -y

# Install Apps
echo "Install Apps"
sudo dnf install -y simple-scan xsane clementine kodi pavucontrol xpaint gimp pinta minitube wine brasero gpodder libXScrnSaver.x86_64 gnome-tweak-tool vlc filezilla ike sound-juicer aisleriot firewall-applet okular lsdvd dvdbackup HandBrake-gui HandBrake-cli makemkv

echo "Install Codecs"
sudo dnf install -y gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-bad gstreamer1-plugins-bad-free-extras gstreamer-plugins-ugly gstreamer1-plugins-ugly gstreamer-plugins-good gstreamer1-plugins-good gstreamer-plugins-good-extras gstreamer1-plugins-good-extras gstreamer1-libav gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-base gstreamer1 gstreamer-ffmpeg libdvdcss libdvdread libdvdnav libmad lame

echo "Install System Utilities"
sudo dnf install -y tmux strace lm_sensors powertop exfat-utils fuse-exfat libvdpau-va-gl tlp  gnome-shell-extension-drive-menu alacarte terminator gnome-power-manager gparted virt-manager libvirt qemu* redhat-lsb.x86_64 htop zsh autotrace curl dnf-plugins-core

echo "Install Development Tools"
sudo dnf install -y emacs gcc-c++ cmake ctags vim-pysmell vagrant vim-enhanced postgresql-devel gitg  mercurial ctags ctags-etags cmake sbcl python-virtualenvwrapper nodejs cmake automake gcc gcc-c++

echo "Install Development Libraries"
sudo dnf install -y glibc-devel.x86_64 kernel-devel

echo "Install Nautilus Extensions"
sudo dnf install -y totem-nautilus rabbitvcs-nautilus sushi nautilus-dropbox file-roller-nautilus brasero-nautilus nautilus-open-terminal nautilus-image-converter evince-nautilus raw-thumbnailer rabbitvcs-gedit rabbitvcs-cli

echo "Install Additional Fonts"
sudo dnf install -y cabextract xorg-x11-font-utils fontconfig font-manager google-droid* freetype-freeworld google-roboto-fonts google-roboto-condensed-fonts

# Install mscorefonts
sudo rpm -ivh https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# Install gedit plugins
echo "Installing gedit plugins"
sudo dnf install -y gedit-plugin* --exclude=gedit-plugin-zeitgeist --exclude=gedit-plugins

echo "Install clojure syntax support for clojure"
git clone git@github.com:mattfenwick/gedit-clojure.git ~/Apps/gedit-clojure
sudo cp ~/Apps/gedit-clojure/clojure.lang /usr/share/gtksourceview-3.0/language-specs/

# Install dependencies for development and shell
echo "Install Python 2.7 devel files"
sudo dnf install -y python-devel openssl-devel python-pip sqlite-devel zlib-devel readline-devel readline

# Copy XResources for better fonts
echo "Copying .Xresources"
cp .Xresources ~/.Xresources

# Setup thermald
echo "Setting up thermald"
sudo dnf copr -y enable hadrons123/thermald
sudo dnf install -y thermal-daemon

sudo systemctl enable thermald
sudo systemctl start thermald

# Setup Chromium
echo "Installing Chromium"
sudo dnf copr -y enable churchyard/chromium-russianfedora-tested
sudo dnf install -y chromium

# Setup skype
echo "Installing Skype"
sudo dnf config-manager -y --add-repo=http://negativo17.org/repos/fedora-skype.repo
sudo dnf install -y skype

# Setup rpmbuild
echo "Setting Up rpmbuild"
sudo dnf install -y mock rpmbuild
sudo useradd -s /sbin/nologin mockbuild

#Turn off Nemo Desktop Icons
echo "Install Nemo"
sudo dnf install -y nemo nemo-fileroller nemo-extensions nemo-rabbitvcs nemo-dropbox nemo-image-converter nemo-emblems

echo "Turning off nemo desktop icons"
gsettings set org.nemo.desktop show-desktop-icons false

echo "Set terminator as default terminal in nemo"
gsettings set org.cinnamon.desktop.default-applications.terminal exec 'terminator'

echo "Set file manager to use nemo as default"
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

echo "Disable nautilus handling the desktop"
gsettings set org.gnome.desktop.background show-desktop-icons false

#Increase inotify limits - I ran into this doing a large sftp copy with filezilla
sudo cp 99-sysctl.conf /etc/sysctl.d/99-sysctl.conf

echo "Install Extra fonts"
./bootstrap-fonts.sh

echo "***********************************"
echo "An Important Message for IKE"
echo
echo "Run the command sudo sysctl -a | grep rp_filter | grep -v arp"
echo "For IKE to work all the values must be zero"
echo "If not update /etc/sysctl.d/99-sysctl.conf to include the following:"
echo "net.ipv4.conf.all.rp_filter = 0"
echo "net.ipv4.conf.default.rp_filter = 0"
echo "And the same lines for each of the physical network adapters e.g. net.ipv4.conf.enp5s0.rp_filter = 0"
echo "Reboot or run sudo sysctl -p  and IKE should work"
echo
echo "*************************************"
echo
echo
echo
echo "All of the automated stuff is done"
echo "Run bootstrap-shell.sh for zsh, rvm, nvm, pythonz and run rvm-pythonz-update.sh to make sure you have the latest versions"
echo "Run bootstrap-vim.sh to setup vim"
echo "You'll want to install google chrome, racket, go, and dart from their websites"
