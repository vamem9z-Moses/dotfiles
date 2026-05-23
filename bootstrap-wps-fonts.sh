echo "Setting up fonts for WPS"

cd /tmp
git clone https://github.com/iamdh4/ttf-wps-fonts.git
if [ ! -d "$HOME/.local/share/fonts" ]; then
  mkdir -p $HOME/.local/share/fonts/wps-fonts
fi
mv ttf-wps-fonts/* $HOME/.local/share/fonts/wps-fonts
fc-cache -f -v $HOME/.local/share/fonts
rm -rf /tmp/ttf-wps-fonts

echo "WPS Fonts are setup"
