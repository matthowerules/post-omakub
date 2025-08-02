#!/bin/bash

# Private Internet Access VPN client. See https://www.privateinternetaccess.com/
echo "Installing Private Internet Access VPN..."

cd /tmp
wget -O pia-vpn.run https://installers.privateinternetaccess.com/download/pia-linux-3.6.2-08398.run
chmod +x pia-vpn.run
./pia-vpn.run
rm pia-vpn.run
cd -

echo "PIA VPN installation completed!"