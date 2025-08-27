#!/bin/bash

# Setup desktop and terminal enhancements
echo "Setting up desktop and terminal enhancements..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Setup default terminal configuration
if gum confirm "Setup default terminal configuration?"; then
    bash "$SCRIPT_DIR/set-default-terminal.sh"
    echo "✓ Default terminal configured"
fi

# Setup GNOME terminal profile
if gum confirm "Setup GNOME terminal profile enhancements?"; then
    bash "$SCRIPT_DIR/set-gnome-terminal-profile.sh" 
    echo "✓ GNOME terminal profile configured"
fi

# Setup Ubuntu Dock
if gum confirm "Setup Ubuntu Dock?"; then
    bash "$SCRIPT_DIR/set-gnome-extensions.sh"
    bash "$SCRIPT_DIR/set-dock.sh"
    echo "✓ Ubuntu Dock configured"
fi

# Setup Vim Config
cat << EOF > ~./vimrc
set tabstop=2
set shiftwidth=2
set expandtab
EOF

# Setup Zellij cfg
cp zellij.cfg.kdl ~/.config/zellij/config.kdl

cat << EOF >> ~/.bachrc

if ! pgrep -f "zellij" >/dev/null; then
  zellij
fi

fastfetch
EOF

echo "Desktop enhancements setup completed!"
