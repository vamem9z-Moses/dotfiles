#!/bin/bash

echo "Install Dependencies for R Packages"
sudo dnf install -y libcurl-devel

echo "Install R and R related tools"
sudo dnf install -y R

echo "Install Zim dependencies"
pip install --user seqdiag

echo "Install Zim"
sudo dnf install -y Zim gtkspell gnome-python2-gtkspell pygtksourceview

echo "Install other research tools"
sudo dnf install -y gnuplot *octave*
