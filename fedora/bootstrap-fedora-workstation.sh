#!/usr/bin/env bash

echo "Turn on fastest mirror"
sudo echo fastestmirror=true | sudo tee -a /etc/dnf/dnf.conf

echo "Update System"
sudo dnf update -y

echo "Add Repo for VSCode"

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

echo "Add google repository key"
wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O $HOME/linux_signing_key.pub
sudo rpm --import $HOME/linux_signing_key.pub
rm $HOME/linux_signing_key.pub

echo "Install Development Tools"

sudo dnf group install -y "Development Tools"
sudo dnf install -y kernel-devel kernel-headers

echo "Install VSCode"
sudo dnf install -y code

# Install Apps
echo "Install Apps"
sudo dnf install -y paprefs pavucontrol gimp pinta wine brasero gpodder libXScrnSaver.x86_64 gnome-tweak-tool filezilla firewall-applet okular chromium

echo "Install System Utilities"
sudo dnf install -y mediawriter gnome-system-log tmux strace exfat-utils fuse-exfat  gnome-shell-extension-drive-menu alacarte terminator gnome-power-manager gparted redhat-lsb.x86_64 htop zsh autotrace curl dnf-plugins-core chrome-gnome-shell

echo "Install Development Tools"
sudo dnf install -y rlwrap gtksourceview2 gtksourceview3 emacs gcc-c++ cmake ctags vim-enhanced gitg mercurial ctags ctags-etags cmake sbcl nodejs cmake automake gcc gcc-c++ pgadmin3 postgresql-server postgresql-contrib uncrustify

echo "Install Development Libraries"
sudo dnf install -y glibc-devel.x86_64 postgresql-devel

echo "Install Nautilus Extensions"
sudo dnf install -y rabbitvcs-nautilus sushi nautilus-dropbox file-roller-nautilus brasero-nautilus nautilus-open-terminal nautilus-image-converter evince-nautilus raw-thumbnailer rabbitvcs-cli

echo "Install GNOME Virtual Filesytem Extensions"
sudo dnf install -y gnome-vfs*

echo "Install Additional Fonts"
sudo dnf install -y cabextract xorg-x11-font-utils fontconfig google-droid* freetype-freeworld google-roboto-fonts google-roboto-condensed-fonts

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

echo "Install Python 3 devel files"
sudo dnf install -y python3-devel python3-pip python3

echo "Install Python libraries"
sudo dnf install -y python-autopep8 python3-autopep8 python3-virtualenvwrapper

echo "Install Tilix"
sudo dnf install -y tilix tilix-nautilus

echo "Install Server Management Tools"
sudo dnf install -y java-wakeonlan

#Increase inotify limits - I ran into this doing a large sftp copy with filezilla
sudo cp 99-sysctl.conf /etc/sysctl.d/99-sysctl.conf

echo "Install Extra fonts"
./bootstrap-fonts.sh

echo "Install Nixnote2"
sudo dnf copr -y enable nunodias/nixnote2
sudo dnf install -y nixnote2

echo "Install dependencies for changing the shell"
sudo dnf install -y elfutils-libelf-devel util-linux-user zsh

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
