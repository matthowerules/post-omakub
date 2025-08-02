#!/bin/bash

# Remove Dropbox application
echo "Removing Dropbox application..."

# Stop Dropbox daemon
killall dropbox 2>/dev/null || true

# Remove Dropbox package
if dpkg -l | grep -q dropbox; then
    sudo apt remove --purge -y dropbox
    echo "✓ Removed Dropbox package"
fi

# Remove Dropbox installation directory
if [[ -d "$HOME/.dropbox-dist" ]]; then
    rm -rf "$HOME/.dropbox-dist"
    echo "✓ Removed Dropbox installation"
fi

# Remove Dropbox config
if [[ -d "$HOME/.dropbox" ]]; then
    rm -rf "$HOME/.dropbox"
    echo "✓ Removed Dropbox configuration"
fi

# Remove desktop file
if [[ -f "$HOME/.local/share/applications/dropbox.desktop" ]]; then
    rm "$HOME/.local/share/applications/dropbox.desktop"
    echo "✓ Removed Dropbox desktop file"
fi

echo "Dropbox application removed successfully!"