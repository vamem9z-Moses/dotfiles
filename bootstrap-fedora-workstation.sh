#!/usr/bin/env bash

# Install Repos
echo "Adding Repos livna, rpmfusion, fedora-handbrake"

yum-config-manager --add-repo=http://negativo17.org/repos/fedora-handbrake.repo
sudo rpm -ivh http://rpm.livna.org/livna-release.rpm
sudo yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#sudo rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-21.noarch.rpm
#sudp rpm -ivh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-21.noarch.rpm

# Install Apps
echo "Install Apps"
sudo dnf install -y tmux freetype-freeworld libXScrnSaver.x86_64 redhat-lsb.x86_64 gnome-tweak-tool vim vlc filezilla libmad lame ike sound-juicer htop aisleriot autotrace firewall-applet gitg python-devel sqlite-devel readline-devel mercurial google-roboto-fonts google-roboto-condensed-fonts zsh python-pysmell ctags ctags-etags cmake sbcl python-virtualenvwrapper nodejs glibc-devel.x68_64 cmake automake gcc gcc-c++ kernel-devel g++ dnf-plugins-core okular  gstreamer-plugins-bad-free-extras gstreamer-plugins-bad-nonfree gstreamer-plugins-bad gstreamer1-plugins-bad-free-extras gstreamer-plugins-ugly gstreamer1-plugins-ugly gstreamer-plugins-good gstreamer1-plugins-good gstreamer-plugins-good-extras gstreamer1-plugins-good-extras gstreamer1-libav gstreamer1-plugins-bad-freeworld gstreamer1-plugin-base-tools gstreamer1-plugins-base gstreamer1 gstreamer-ffmpeg lsdvd dvdbackup Handbrake-gui Handbrake-cli makemkv libdvdcss libdvdread libdvdnav curl cabextract xorg-x11-font-utils fontconfig clementine

# Install mscorefonts
sudo rpm -ivh https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# Install pysmell
echo "Install pysmell"
sudo pip install pysmell

# Install dependencies for development and shell
echo "Install Python 2.7 devel files"
sudo dnf install -y python-devel

# Copy XResources for better fonts
echo "Copying .Xresources"
cp .Xresources ~/.Xresources

echo "All of the automated stuff is done"
echo "Get  .gitconfig and id files and pull down /bin from github"
echo "Run bootstrap-shell.sh for zsh, rvm, nvm, pythonz and run rvm-pythonz-update.sh
to make sure you have the latest versions"
echo "Run bootstrap-vim.sh to setup vim"
echo "You'll want to install skype, vagrant, virtualbox, google chrome, racket, go, and dart from their websites"
