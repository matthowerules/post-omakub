#!/bin/bash

# Remove HEY application
echo "Removing HEY application..."

# Remove desktop file
if [[ -f "$HOME/.local/share/applications/HEY.desktop" ]]; then
    rm "$HOME/.local/share/applications/HEY.desktop"
    echo "✓ Removed HEY desktop file"
fi

# Remove from applications menu  
if [[ -f "$HOME/Applications/HEY.sh" ]]; then
    rm "$HOME/Applications/HEY.sh"
    echo "✓ Removed HEY launcher"
fi

echo "HEY application removed successfully!"