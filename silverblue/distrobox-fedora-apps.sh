#!/usr/bin/env sh

echo "Update repo"
echo "" 

sudo dnf update --refresh

echo "Install utilities"
echo ""

sudo dnf install zsh git

echo "Install Additional Fonts"
echo ""
sudo dnf install -y cabextract xorg-x11-font-utils fontconfig
sudo mv /usr/share/X11/fonts/util $HOME/.fonts/
sudo chown -R $USER:$USER ~/.fonts

echo "Install mscorefonts"
sudo rpm -ivh https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
sudo mv /usr/share/fonts/msttcore $HOME/.fonts/
sudo chown -R $USER:$USER ~/.fonts

echo "Install vscode"
echo ""

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf install -y code
distrobox-export --app code

echo "Install 1password"
echo ""

sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
sudo dnf install -y 1password
distrobox-export --app 1password

echo "Update the desktop database cache to make the icons show"
echo "If this doesn't work you may have to logout and log back in"
echo ""

update-desktop-database $HOME/.local/share/applications

echo "Make Podman and Podman-Compose available to apps container"
echo ""

sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/podman
sudo ln -s /usr/bin/distrobox-host-exec /usr/bin/podman-compose


echo ""
echo ""
echo "You will need to run fc-cache -f -v in the host terminal to update the font cache"