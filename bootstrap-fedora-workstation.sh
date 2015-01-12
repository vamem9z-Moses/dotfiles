#!/usr/bin/env bash

# Install Repos
echo "Adding Repos livna, rpmfusion, fedora-handbrake"

sudo yum-config-manager --add-repo=http://negativo17.org/repos/fedora-handbrake.repo
sudo rpm -ivh http://rpm.livna.org/livna-release.rpm
sudo yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install Apps
echo "Install Apps"
sudo yum install -y gnome-power-manager gparted virt-manager libvirt qemu*  wine brasero gpodder strace google-droid* lm_sensors python-pysmell powertop tmux freetype-freeworld libXScrnSaver.x86_64 redhat-lsb.x86_64 gnome-tweak-tool vim vlc filezilla libmad lame ike sound-juicer htop aisleriot autotrace firewall-applet gitg python-devel sqlite-devel readline-devel mercurial google-roboto-fonts google-roboto-condensed-fonts zsh python-pysmell ctags ctags-etags cmake sbcl python-virtualenvwrapper nodejs glibc-devel.x86_64 cmake automake gcc gcc-c++ kernel-devel dnf-plugins-core okular  gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-bad gstreamer1-plugins-bad-free-extras gstreamer-plugins-ugly gstreamer1-plugins-ugly gstreamer-plugins-good gstreamer1-plugins-good gstreamer-plugins-good-extras gstreamer1-plugins-good-extras gstreamer1-libav gstreamer1-plugins-bad-freeworld gstreamer1-plugins-base-tools gstreamer1-plugins-base gstreamer1 gstreamer-ffmpeg lsdvd dvdbackup HandBrake-gui HandBrake-cli makemkv libdvdcss libdvdread libdvdnav curl cabextract xorg-x11-font-utils fontconfig clementine nemo nemo-fileroller nemo-extensions nemo-rabbitvcs nemo-dropbox nemo-image-converter nemo-emblems totem-nautilus rabbitvcs-nautilus sushi nautilus-dropbox file-roller-nautilus brasero-nautilus nautilus-open-terminal nautilus-image-converter evince-nautilus raw-thumbnailer rabbitvcs-gedit rabbitvcs-cli tlp simple-scan xsane font-manager gnome-shell-extension-drive-menu alacarte terminator

# Install mscorefonts
sudo rpm -ivh https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# Install gedit plugins
echo "Installing gedit plugins"
sudo yum install -y gedit-plugin* --exclude=gedit-plugin-zeitgeist --exclude=gedit-plugins

# Install dependencies for development and shell
echo "Install Python 2.7 devel files"
sudo yum install -y python-devel

# Copy XResources for better fonts
echo "Copying .Xresources"
cp .Xresources ~/.Xresources

# Add ctag support for go
echo "Adding go ctag support"
./bootstrap-ctags.sh

# Setup thermald
echo "Setting up thermald"
sudo dnf copr enable hadrons123/thermald
sudo yum install -y thermal-daemon

sudo systemctl enable thermald
sudo systemctl start thermald

# Setup Chromium
echo "Installing Chromium"
sudo dnf copr enable churchyard/chromium-russianfedora
sudo yum install -y chromium

#Turn off Nemo Desktop Icons
echo "Turning off nemo desktop icons"
gsettings set org.nemo.desktop show-desktop-icons false

#Increase inotify limits - I ran into this doing a large sftp copy with filezilla
cp 99-sysctl.conf /etc/sysctl.d/99-sysctl.conf

echo "All of the automated stuff is done"
echo "Run bootstrap-shell.sh for zsh, rvm, nvm, pythonz and run rvm-pythonz-update.sh to make sure you have the latest versions"
echo "Run bootstrap-vim.sh to setup vim"
echo "You'll want to install skype, vagrant, virtualbox, google chrome, racket, go, and dart from their websites"
