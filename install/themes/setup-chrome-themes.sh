#!/bin/bash

# Setup Chrome theme integration for all omakub themes
echo "Setting up Chrome theme integration..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OMAKUB_THEMES_DIR="$HOME/.local/share/omakub/themes"

# Check if omakub themes directory exists
if [[ ! -d "$OMAKUB_THEMES_DIR" ]]; then
    echo "Omakub themes directory not found. Please ensure omakub is properly installed."
    exit 1
fi

# Copy the main Chrome theme setter to omakub themes directory
cp "$SCRIPT_DIR/set-chrome-theme.sh" "$OMAKUB_THEMES_DIR/"

# Copy individual Chrome theme configs to their respective theme directories
for chrome_config in "$SCRIPT_DIR/chrome-configs"/*.sh; do
    if [[ -f "$chrome_config" ]]; then
        theme_name=$(basename "$chrome_config" | sed 's/chrome\.sh$//')
        theme_dir="$OMAKUB_THEMES_DIR/$theme_name"
        
        if [[ -d "$theme_dir" ]]; then
            cp "$chrome_config" "$theme_dir/chrome.sh"
            echo "✓ Added Chrome theme support for $theme_name"
        else
            echo "⚠ Theme directory not found for $theme_name, skipping..."
        fi
    fi
done

# Update omakub theme switcher to include Chrome theme updates
if [[ -f "$HOME/.local/bin/omakub-theme" ]]; then
    # Check if Chrome theme integration is already added
    if ! grep -q "set-chrome-theme.sh" "$HOME/.local/bin/omakub-theme"; then
        echo "
# Chrome theme integration added by post-omakub
if [[ -f \"\$OMAKUB_THEMES_DIR/set-chrome-theme.sh\" ]]; then
    bash \"\$OMAKUB_THEMES_DIR/set-chrome-theme.sh\"
fi" >> "$HOME/.local/bin/omakub-theme"
        echo "✓ Updated omakub theme switcher to include Chrome themes"
    else
        echo "✓ Chrome theme integration already present in omakub theme switcher"
    fi
fi

echo "Chrome theme integration setup completed!"