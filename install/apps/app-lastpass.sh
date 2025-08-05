#!/bin/bash

# Install LastPass Chrome extension automatically

LASTPASS_EXTENSION_ID="hdokiejnpimakedhajhdlcegeplioahd"

# Create Chrome extensions directory if it doesn't exist
sudo mkdir -p /opt/google/chrome/extensions

# Create JSON file to auto-install LastPass extension
echo '{"external_update_url": "https://clients2.google.com/service/update2/crx"}' | sudo tee /opt/google/chrome/extensions/${LASTPASS_EXTENSION_ID}.json > /dev/null

# Firefox LastPass extension configuration
FIREFOX_LASTPASS_ID="lastpass-password-manager@lastpass.com"
FIREFOX_PROFILE_DIR="$HOME/.mozilla/firefox"

# Wait for Firefox profile to be created and find default profile
if [ -d "$FIREFOX_PROFILE_DIR" ]; then
    DEFAULT_PROFILE=$(find "$FIREFOX_PROFILE_DIR" -name "*.default-release" | head -1)
    if [ -n "$DEFAULT_PROFILE" ]; then
        EXTENSIONS_DIR="$DEFAULT_PROFILE/extensions"
        mkdir -p "$EXTENSIONS_DIR"
        
        # Create extension installation manifest
        cat > "$EXTENSIONS_DIR/${FIREFOX_LASTPASS_ID}.json" << EOF
{
  "name": "LastPass: Free Password Manager",
  "description": "LastPass, an award-winning password manager, saves your passwords and gives you secure access from every computer and mobile device.",
  "homepage_url": "https://addons.mozilla.org/firefox/addon/lastpass-password-manager/",
  "manifest_version": 2
}
EOF
        echo "LastPass Firefox extension configured"
    else
        echo "Firefox profile not found. Please start Firefox once to create profile, then re-run this script."
    fi
else
    echo "Firefox not installed or profile directory not found"
fi

echo "LastPass extension configured for automatic installation"
echo "Extensions will be available after browser restart"
