#!/bin/bash

# Cloud storage client for pCloud. See https://www.pcloud.com/
echo "Installing pCloud..."

# Install required dependency
sudo apt install -y libfuse2t64

# Stage desktop icon and create desktop shortcut
cp pcloud-icon-96.png USER/.local/share/omakub/applications/icons/pCloud.png

cat <<EOF >~/.local/share/applications/pCloud.desktop
[Desktop Entry]
Version=1.0
Name=pCloud
Comment=Secure Cloud Storage
Exec=pcloud
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub/applications/icons/pCloud.png
Categories=Utilites;
StartupNotify=true
EOF

# Download and install pCloud
cd /tmp
wget -O pcloud https://linuxstans.com/goto/pcloud-download-64bit/
sudo chmod +x pcloud
sudo mv pcloud /usr/bin/pcloud
cd -


echo "pCloud installed successfully! Run 'pcloud' to start."
