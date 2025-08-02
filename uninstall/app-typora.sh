#!/bin/bash

# Remove Typora application
echo "Removing Typora application..."

# Remove Typora application
if command -v typora &> /dev/null; then
    sudo apt remove --purge -y typora
    echo "✓ Removed Typora package"
fi

# Remove repository key and source
if [[ -f /usr/share/keyrings/typora.gpg ]]; then
    sudo rm /usr/share/keyrings/typora.gpg
    echo "✓ Removed Typora GPG key"
fi

if [[ -f /etc/apt/sources.list.d/typora.list ]]; then
    sudo rm /etc/apt/sources.list.d/typora.list
    echo "✓ Removed Typora repository"
fi

# Remove config files
if [[ -d "$HOME/.config/typora" ]]; then
    rm -rf "$HOME/.config/typora"
    echo "✓ Removed Typora configuration"
fi

sudo apt update

echo "Typora application removed successfully!"