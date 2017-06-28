#!/usr/bin/env bash

echo "Update repo"
sudo yum -y update

echo "Add EPEL Repo"
sudo yum -y install epel-release

echo "Install Utilities"
sudo yum -y install python-virtualenvwrapper python2-pip vim git mercurial zsh filezilla htop tree

echo "Install VPN Dependency"
sudo yum -y install NetworkManager-vpnc-gnome

echo "Install Development Tools"
sudo yum -y install gcc gcc-c++ cmake automake ctags python34

echo "Install dependencies for Virtualbox Guest Additions (requires epel"
sudo yum -y install kernel* kernel-devel kernel-headers dkms make bzip2 perl

echo "Install Pysmell"
pip install --user pysmell

echo "Install virtualenvwraper for python 3"
pip3 install --user virtualenvwrapper

echo "Install Vim 8"
cd /etc/yum.repos.d/
sudo wget https://copr.fedorainfracloud.org/coprs/mcepl/vim8/repo/epel-7/mcepl-vim8-epel-7.repo
sudo yum -y update

echo "Install updated dev tool for YCM"
#Reference - https://gist.github.com/puremourning/a41b4c6ac732091f63736e3ccb6d8d67
sudo yum install -y centos-release-scl
sudo yum install yum install -y devtoolset-6

echo "Install tilix"
cd /etc/yum.repos.d/
sudo wget https://copr.fedorainfracloud.org/coprs/ivoarch/Tilix/repo/epel-7/ivoarch-Tilix-epel-7.repos
sudo yum install -y tilix

echo "Install Java Development Dependencies"
sudo yum install -y maven java-1.8.0-openjdk java-1.8.0-openjdk-devel java-1.8.0-openjdk-src java-1.8.0-openjdk-javadoc java-1.8.0-openjdk-headless

echo "Copy Icon to local applications diretory"
mkdir $HOME/.local/share/icons
cp ./eclipseicon.xpm $HOME/.local/share/icons

echo "Copy desktop to local application directory"
cp ./eclipse.desktop $HOME/.local/share/applications

echo "Be sure to create a symbolic link between the eclipse executable and the $/HOME/bin directory e.g. ln -s ~/Apps/eclipse/eclipse ~/bin"

echo "Install VSCode"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo yum install -y code

echo "Update git"
sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
sudo yum install -y yum-plugin-replace
sudo yum replace -y  git --replace-with rh-git29
sudo yum install -y httpd24-libcurl-devel httpd24-libcurl
sudo ln -s /opt/rh/rh-git29/root/usr/bin/git /usr/local/bin/git
sudo ln -s /opt/rh/rh-git29/root/usr/bin/git-receive-pack /usr/local/bin/git-receive-pack
sudo ln -s /opt/rh/rh-git29/root/usr/bin/git-shell /usr/local/bin/git-shell
sudo ln -s /opt/rh/rh-git29/root/usr/bin/git-upload-archive /usr/local/bin/git-upload-archive
sudo ln -s /opt/rh/rh-git29/root/usr/bin/git-upload-pack /usr/local/bin/git-upload-pack
sudo touch /etc/ld.so.conf.d/rh-git.conf
sudo echo  "/opt/rh/httpd24/root/usr/lib64/" | sudo tee -a /etc/ld.so.conf.d/rh-git.conf
sudo ldconfig
