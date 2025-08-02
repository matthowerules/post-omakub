#!/bin/bash

# Enable SSH daemon and configure firewall for secure remote access
echo "Setting up SSH and UFW firewall..."

# Enable SSH daemon
sudo systemctl enable --now ssh

# Configure UFW firewall
sudo ufw allow ssh
sudo ufw --force enable

echo "SSH and UFW firewall configured successfully!"