#!/bin/bash

# Install Ublock Origins and Lite browser extensions automatically

UBLOCK_EXTENSION_ID="ddkjiahejlhfcafbddmgiahcphecmpfh"

# Create Chrome extensions directory if it doesn't exist
sudo mkdir -p /opt/google/chrome/extensions

# Create JSON file to auto-install LastPass extension
echo '{"external_update_url": "https://clients2.google.com/service/update2/crx"}' | sudo tee /opt/google/chrome/extensions/${UBLOCK_EXTENSION_ID}.json > /dev/null

#TODO - Firefox

echo "Ublock Origin Lite Chrome extension configured for automatic installation"
echo "The extension will be available after Chrome is restarted"
