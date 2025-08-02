#!/bin/bash

# Remove Basecamp application
echo "Removing Basecamp application..."

# Remove desktop file
if [[ -f "$HOME/.local/share/applications/Basecamp.desktop" ]]; then
    rm "$HOME/.local/share/applications/Basecamp.desktop"
    echo "✓ Removed Basecamp desktop file"
fi

# Remove from applications menu
if [[ -f "$HOME/Applications/Basecamp.sh" ]]; then
    rm "$HOME/Applications/Basecamp.sh"
    echo "✓ Removed Basecamp launcher"
fi

echo "Basecamp application removed successfully!"