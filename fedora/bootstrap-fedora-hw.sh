#!/usr/bin/env sh

echo "Bootstrap a Hardware Based Workstation"

./bootstrap-fedora-repos.sh
./bootstrap-fedora-hw-deps.sh
./bootstrap-fedora-workstation.sh
./bootstrap-fedora-multimedia.sh
