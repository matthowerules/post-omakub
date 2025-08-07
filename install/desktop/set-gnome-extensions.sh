#!/usr/bin/env sh

# Re-enable the dock
gnome-extensions enable ubuntu-dock@ubuntu.com

# Do not show unmounted volumes in the dock
gsettings set org.gnome.shell.extensions.dash-to-dock show-unmounted-volumes false

# Disable panel mode
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# Set dock icon size
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32

# Set workspaces to 4
gsettings set org.gnome.desktop.wm.preferences num-workspaces 4

# Enable the panel appindicators
gnome-extensions enable ubuntu-appindicators@ubuntu.com

# Disable the Ulauncher panel icon
sed -i 's/"show-indicator-icon": true,/"show-indicator-icon": false,/' ~/.config/ulauncher/settings.json
pkill ulauncher
nohup ulauncher > /dev/null 2>&1 &

# Configure Tactile 
gsettings set org.gnome.shell.extensions.tactile col-0 1
gsettings set org.gnome.shell.extensions.tactile col-1 1
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 1
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile gap-size 0

