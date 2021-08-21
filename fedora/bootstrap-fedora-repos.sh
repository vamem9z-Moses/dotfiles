#!/usr/bin/env sh

echo "Turn on fastest mirror"
sudo echo fastestmirror=true | sudo tee -a /etc/dnf/dnf.conf

echo "Add Repo for VSCode"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

echo "Add google repository key"
wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O $HOME/linux_signing_key.pub
sudo rpm --import $HOME/linux_signing_key.pub
rm $HOME/linux_signing_key.pub

echo "Add negativo17 nvidia repos"
sudo dnf config-manager -y --add-repo=https://negativo17.org/repos/fedora-nvidia.repo
sudo dnf config-manager -y --add-repo=http://negativo17.org/repos/fedora-multimedia.repo
