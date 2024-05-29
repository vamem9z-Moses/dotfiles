#!/usr/bin/env sh

echo "Create distrobox named apps with the same hostname so that the exported apps will show the correct icons when running"
echo ""
echo "Notice no systemd in the image as it significantly increases power usage"
echo ""   
distrobox create --image fedora:40 --name apps --hostname "$(uname -n)"

echo "Create distrobox name dev for development activities"
echo ""
distrobox create --image io.docker/debian:latest --name dev