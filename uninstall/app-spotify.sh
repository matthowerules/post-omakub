#!/bin/bash

# Remove Spotify application
echo "Removing Spotify application..."

# Remove Spotify snap package
if snap list spotify &> /dev/null; then
    sudo snap remove spotify
    echo "✓ Removed Spotify snap package"
fi

# Remove Spotify apt package if installed
if dpkg -l | grep -q spotify-client; then
    sudo apt remove --purge -y spotify-client
    echo "✓ Removed Spotify apt package"
fi

# Remove repository
if [[ -f /etc/apt/sources.list.d/spotify.list ]]; then
    sudo rm /etc/apt/sources.list.d/spotify.list
    echo "✓ Removed Spotify repository"
fi

# Remove GPG key
if [[ -f /usr/share/keyrings/spotify.gpg ]]; then
    sudo rm /usr/share/keyrings/spotify.gpg
    echo "✓ Removed Spotify GPG key"
fi

sudo apt update

echo "Spotify application removed successfully!"