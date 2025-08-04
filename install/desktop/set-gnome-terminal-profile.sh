#!/bin/bash

# Configure GNOME Terminal with custom profile settings
echo "Setting up GNOME Terminal profile..."

# Load the terminal configuration
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-settings.txt

# Set the default prompt
cp prompt ~/.local/share/omakub/defaults/bash/prompt

# Blasphemy that it's lsa instead of ll
cp aliases ~/.local/share/omakub/defaults/bash/aliases

echo "GNOME Terminal profile configured successfully!"
