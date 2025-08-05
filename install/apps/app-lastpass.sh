#!/bin/bash

# Install LastPass Chrome extension automatically

LASTPASS_EXTENSION_ID="hdokiejnpimakedhajhdlcegeplioahd"

# Create Chrome extensions directory if it doesn't exist
sudo mkdir -p /opt/google/chrome/extensions

# Create JSON file to auto-install LastPass extension
echo '{"external_update_url": "https://clients2.google.com/service/update2/crx"}' | sudo tee /opt/google/chrome/extensions/${LASTPASS_EXTENSION_ID}.json > /dev/null

#TODO - Firefox

echo "LastPass extension configured for automatic installation"
echo "The extension will be available after Chrome is restarted"
