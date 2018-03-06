#!/bin/bash

echo "Install Dependencies for R Packages"
sudo dnf install -y libcurl-devel community-mysql-devel

echo "Install R and R related tools"
sudo dnf install -y R

echo "Install Zim dependencies"
pip install --user seqdiag

echo "Install Zim"
sudo dnf install -y Zim gtkspell gnome-python2-gtkspell pygtksourceview

echo "Install other research tools"
sudo dnf install -y gnuplot *octave* xournal

echo "Install Rodeo"
#### add the rodeo yum repo
sudo wget http://rodeo-rpm.yhat.com/rodeo-rpm.repo -P /etc/yum.repos.d/

##### install the package and run it
sudo dnf install -y rodeo

echo "Install Texlive Dependencies for Jupyter"
sudo dnf install -y texlive-adjustbox texlive-upquote texlive-ulem
