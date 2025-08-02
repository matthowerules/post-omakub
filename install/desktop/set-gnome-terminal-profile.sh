#!/bin/bash

# Configure GNOME Terminal with custom profile settings
echo "Setting up GNOME Terminal profile..."

# Create the terminal profile configuration
cat > /tmp/gnome-term-settings.txt << 'EOF'
[/]
default='66a7e05d-9ab5-42b7-91d2-8fbbe98fed5d'
list=['b1dcc9dd-5262-4d8d-a863-c897e6d979b9', '66a7e05d-9ab5-42b7-91d2-8fbbe98fed5d']

[:66a7e05d-9ab5-42b7-91d2-8fbbe98fed5d]
background-color='rgb(0,0,0)'
default-size-columns=120
default-size-rows=36
foreground-color='rgb(0,255,0)'
use-theme-colors=false
visible-name='default'

[:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
visible-name='system default'
EOF

# Load the terminal configuration
dconf load /org/gnome/terminal/legacy/profiles:/ /tmp/gnome-term-settings.txt

# Clean up temporary file
rm /tmp/gnome-term-settings.txt

echo "GNOME Terminal profile configured successfully!"