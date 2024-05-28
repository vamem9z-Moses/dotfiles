#!/usr/bin/env sh

echo "Install flathub" 
echo ""

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Install ui utilites"
echo ""

flatpak install --or-update com.github.tchx84.Flatseal com.mattjakeman.ExtensionManager -y

echo "Install utilities"
echo ""

flatpak install --or-update org.filezillaproject.Filezilla org.fedoraproject.FirewallConfig -y

echo "Install audio / visual apps and tools"
echo ""

flatpak install --or-update org.videolan.VLC.Plugin.makemkv com.makemkv.MakeMKV org.videolan.VLC org.videolan.VLC.Plugin.pause_click org.videolan.VLC.Plugin.bdj org.videolan.VLC.Plugin.fdkaac org.clementine_player.Clementine org.gnome.SoundJuicer org.gnome.Cheese org.gpodder.gpodder -y

echo "Install productivity apps"
echo ""

flatpak install --or-update org.libreoffice.LibreOffice com.hamrick.VueScan com.strlen.TreeSheets com.github.phase1geo.minder org.freeplane.App com.github.tenderowl.norka net.cozic.joplin_desktop -y

echo "Install development tools"
echo ""

flatpak install --or-update org.gnome.Boxes io.podman_desktop.PodmanDesktop io.dbeaver.DBeaverCommunity io.dbeaver.DBeaverCommunity.Client.pgsql io.dbeaver.DBeaverCommunity.Client.mariadb io.github.shiftey.Desktop -y

echo "Install browsers"
echo "" 

flatpak install --or-update com.microsoft.Edge com.brave.Browser com.google.Chrome com.opera.Opera -y