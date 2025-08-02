#!/bin/bash

# Cloud storage client for pCloud. See https://www.pcloud.com/
echo "Installing pCloud..."

# Install required dependency
sudo apt install -y libfuse2t64

# Download and install pCloud
cd /tmp
wget -O pcloud https://linuxstans.com/goto/pcloud-download-64bit/
sudo chmod +x pcloud
sudo mv pcloud /usr/bin/pcloud
cd -

echo "pCloud installed successfully! Run 'pcloud' to start."