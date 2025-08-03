#!/usr/bin/env sh

#Re-enable the dock
gnome-extensions enable ubuntu-dock@ubuntu.com

#Set dock icon size
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
