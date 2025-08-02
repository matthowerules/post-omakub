#!/bin/bash

# Remove Zoom application
echo "Removing Zoom application..."

# Remove Zoom package
if dpkg -l | grep -q zoom; then
    sudo apt remove --purge -y zoom
    echo "✓ Removed Zoom package"
fi

# Remove config files
if [[ -d "$HOME/.zoom" ]]; then
    rm -rf "$HOME/.zoom"
    echo "✓ Removed Zoom configuration"
fi

if [[ -d "$HOME/.config/zoomus.conf" ]]; then
    rm -f "$HOME/.config/zoomus.conf"
    echo "✓ Removed Zoom config file"
fi

echo "Zoom application removed successfully!"