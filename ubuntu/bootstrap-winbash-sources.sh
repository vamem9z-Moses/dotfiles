#!/usr/bin/env bash

# Add source files to sources.list
echo | sudo tee --append /etc/apt/sources.list
echo "#Add Sources" | sudo tee --append /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse" | sudo tee --append /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse" | sudo tee --append /etc/apt/sources.list
echo "deb-src  http://security.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse" | sudo tee --append /etc/apt/sources.list

