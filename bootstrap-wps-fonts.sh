echo "Setting up fonts for WPS"

cd /tmp
git clone https://github.com/iamdh4/ttf-wps-fonts.git
sudo mkdir /usr/share/fonts/wps-fonts
sudo mv ttf-wps-fonts/* /usr/share/fonts/wps-fonts
sudo chmod 644 /usr/share/fonts/wps-fonts/*
sudo fc-cache -vfs
rm -rf /tmp/ttf-wps-fonts

echo "WPS Fonts are setup"
