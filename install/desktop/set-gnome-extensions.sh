#!/usr/bin/env sh

#Re-enable the dock
gnome-extensions enable ubuntu-dock@ubuntu.com

#Set dock icon size
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32

# Configure Tactile 
gsettings set org.gnome.shell.extensions.tactile col-0 1
gsettings set org.gnome.shell.extensions.tactile col-1 1
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 1
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile gap-size 0

