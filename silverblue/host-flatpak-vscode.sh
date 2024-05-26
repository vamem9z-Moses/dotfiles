#!/usr/bin/env sh

echo "Install vscode from flathub"
echo ""

flatpak install com.visualstudio.code.tool.podman com.visualstudio.code -y
flatpak override --user --filesystem=xdg-run/podman com.visualstudio.code

echo "Setup vscode for use with Distrobox"
echo ""

mkdir -p $HOME/.lcoal/bin
curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/extras/podman-host -o ~/.local/bin/podman-host
chmod +x ~/.local/bin/podman-host

echo "Create script to launch vscode directly attached to a Distrobox"
echo ""

curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/extras/vscode-distrobox -o ~/.local/bin/vscode-distrobox
chmod +x ~/.local/bin/vscode-distrobox

echo ""
echo ""
echo ""
echo "To finish the setup install the devcontainers extension and update the " 
echo "docker path with the podman-host executable $HOME/.local/bin/podman-host."
echo ""
echo ""
echo ""
echo "For more infomrmation see https://github.com/89luca89/distrobox/blob/main/docs/posts/integrate_vscode_distrobox.md"
