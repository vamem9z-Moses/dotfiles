#!/usr/bin/env bash

echo "Update repo"
sudo yum -y update

echo "Add EPEL Repo"
sudo yum -y install epel-release

echo "Install Utilities"
sudo yum -y install python-virtualenvwrapper python2-pip vim git mercurial zsh

echo "Install Development Tools"
sudo yum -y install gcc gcc-c++ cmake automake ctags

echo "Install Pysmell"
sudo pip install pysmell

