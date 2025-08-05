#!/bin/bash

sudo snap install firefox

# Disable Firefox telemetry
FIREFOX_PROFILE_DIR="$HOME/.mozilla/firefox"

# Function to disable telemetry in Firefox preferences
disable_firefox_telemetry() {
    if [ -d "$FIREFOX_PROFILE_DIR" ]; then
        DEFAULT_PROFILE=$(find "$FIREFOX_PROFILE_DIR" -name "*.default-release" | head -1)
        if [ -n "$DEFAULT_PROFILE" ]; then
            USER_JS="$DEFAULT_PROFILE/user.js"
            
            # Create or append to user.js to disable telemetry
            cat >> "$USER_JS" << EOF
// Disable Firefox telemetry and data collection
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
EOF
            echo "Firefox telemetry disabled"
        else
            echo "Firefox profile not found. Telemetry will be disabled on first Firefox startup."
            # Create a script that will run on first Firefox startup
            mkdir -p "$HOME/.local/bin"
            cat > "$HOME/.local/bin/firefox-setup-telemetry.sh" << 'SETUP_EOF'
#!/bin/bash
FIREFOX_PROFILE_DIR="$HOME/.mozilla/firefox"
if [ -d "$FIREFOX_PROFILE_DIR" ]; then
    DEFAULT_PROFILE=$(find "$FIREFOX_PROFILE_DIR" -name "*.default-release" | head -1)
    if [ -n "$DEFAULT_PROFILE" ]; then
        USER_JS="$DEFAULT_PROFILE/user.js"
        if [ ! -f "$USER_JS" ] || ! grep -q "toolkit.telemetry.enabled" "$USER_JS"; then
            cat >> "$USER_JS" << EOF
// Disable Firefox telemetry and data collection
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
EOF
        fi
        rm "$HOME/.local/bin/firefox-setup-telemetry.sh"
    fi
fi
SETUP_EOF
            chmod +x "$HOME/.local/bin/firefox-setup-telemetry.sh"
        fi
    else
        echo "Firefox profile directory not found. Telemetry settings will be applied on first run."
    fi
}

# Run telemetry disabling function
disable_firefox_telemetry

