# Post-Omakub Setup

A collection of additional applications, security enhancements, and customizations to run after installing the base [Omakub](https://omakub.org) system.

## Overview

Omakub is awesome, and very opinionated... I love it and use it as a starting point, but I am also opinionated, so this is my curated set of enhancements that build on top standard Omakub, including:

- **Additional Applications**: Apple Music, Chromium, Discord, Firefox, IRC clients (Konversation, Halloy), LastPass, Mailspring, pCloud, PIA VPN, Remmina, tmux, uBlock Origin Lite
- **System Config**: SSH daemon and UFW firewall configuration  
- **Desktop Enhancements**: Default terminal set to GNOME, re-added Dock, some  configurations and UI
- **Cleanup Tools**: Remove some default applications (Basecamp, Hey, etc.)

## Prerequisites

- **Omakub must already be installed** - Install from [omakub.org](https://omakub.org)
- Ubuntu 22.04+ or compatible Linux distribution
- Internet connection for downloading applications

## Quick Start

```bash
# Clone this repository
git clone https://github.com/matthowerules/post-omakub.git
cd post-omakub

# Run the interactive installer
./install.sh
```

## What's Included

### 🚀 Additional Applications

| Application | Description | Installation Script |
|-------------|-------------|-------------------|
| **Apple Music** | Apple Music web app | `install/apps/app-applemusic.sh` |
| **Chromium** | Chromium browser | `install/apps/app-chromium.sh` |
| **Discord** | Enhanced Discord installation | `install/apps/app-discord.sh` |
| **Firefox** | Firefox browser with telemetry disabled | `install/apps/app-firefox.sh` |
| **Applets** | Application launcher/utilities (htop) | `install/apps/app-applet.sh` |
| **IRC Clients** | IRC communication clients | `install/apps/app-irc.sh` |
| **LastPass** | Password manager with Chrome & Firefox extensions | `install/apps/app-lastpass.sh` |
| **Mailspring** | Modern email client | `install/apps/app-mailspring.sh` |
| **pCloud** | Cloud storage client | `install/apps/app-pcloud.sh` |
| **PIA VPN** | Private Internet Access VPN client | `install/apps/app-pia-vpn.sh` |
| **Remmina** | Remote desktop client | `install/apps/app-remmina.sh` |
| **tmux** | Terminal multiplexer | `install/apps/app-tmux.sh` |
| **uBlock Origin Lite** | Chrome & Firefox ad blocker extensions | `install/apps/app-ublock.sh` |

### 🔒 Security Enhancements

- **SSH Daemon**: Automatically enabled and configured
- **UFW Firewall**: Enabled with SSH access configured
- **Firefox Privacy**: Telemetry and data collection disabled
- Located in: `install/security/security-setup.sh`


### 🖥️ Desktop Enhancements

- **Default Terminal Configuration**: I am not a Alacritty or Zellij guy and enjoy GNOME terminal. Don't hate.
- **GNOME Terminal Profiles**: Improved terminal colors (with default)
- **Ubuntu Dock**: I like the dock so it's back (with smaller icons)

### 🗑️ Application Cleanup

Remove applications that may not be needed:
- Basecamp (web app)
- HEY (web app)  
- Typora (markdown editor)
- Spotify (use web version instead)
- Zoom (use web version instead)
- Dropbox (replaced with pCloud)

## Installation Options

### Interactive Mode (Recommended)
```bash
./install.sh
```
Choose exactly what you want to install through an interactive menu.

### Install Everything
```bash
./install.sh
# Choose option 5 from the menu
```

### Manual Installation
Run individual components:

```bash
# Security hardening only
bash install/security/security-setup.sh

# Desktop enhancements only
bash install/desktop/setup-enhancements.sh

# Individual applications
bash install/apps/app-lastpass.sh
bash install/apps/app-pcloud.sh
# etc...
```

## File Structure

```
post-omakub/
├── LICENSE                             # MIT License
├── README.md                           # This documentation
├── echo                                # Echo utility (appears to be a binary)
├── install.sh                          # Main interactive installer
├── install/
│   ├── apps/                           # Additional applications
│   │   ├── app-applemusic.sh           # Apple Music web app
│   │   ├── app-applet.sh               # Application launcher/utility
│   │   ├── app-chromium.sh             # Chromium browser
│   │   ├── app-discord.sh              # Discord
│   │   ├── app-firefox.sh              # Firefox with extensions
│   │   ├── app-irc.sh                  # IRC client
│   │   ├── app-lastpass.sh             # LastPass extension
│   │   ├── app-mailspring.sh           # Email client
│   │   ├── app-pcloud.sh               # Cloud storage
│   │   ├── app-pia-vpn.sh              # VPN client
│   │   ├── app-remmina.sh              # Remote desktop
│   │   ├── app-tmux.sh                 # Terminal multiplexer
│   │   ├── app-ublock.sh               # uBlock Origin Lite
│   │   ├── music-icon-96.png           # Apple Music icon
│   │   └── pcloud-icon-96.png          # pCloud icon
│   ├── security/
│   │   └── security-setup.sh           # SSH + UFW setup
│   └── desktop/
│       ├── aliases                     # Shell aliases configuration
│       ├── gnome-terminal-settings.txt # Terminal settings export
│       ├── prompt                      # Custom shell prompt
│       ├── setup-enhancements.sh       # Desktop enhancement setup
│       ├── set-default-terminal.sh     # Terminal configuration
│       ├── set-dock.sh                 # Dock configuration
│       ├── set-gnome-extensions.sh     # GNOME extensions
│       └── set-gnome-terminal-profile.sh # Terminal profile
└── uninstall/                          # Application removal scripts
    ├── app-basecamp.sh
    ├── app-dropbox.sh
    ├── app-hey.sh
    ├── app-spotify.sh
    ├── app-typora.sh
    └── app-zoom.sh
```

## Compatibility

- **Base System**: Requires Omakub to be installed first
- **Ubuntu**: 22.04+ (same as Omakub requirements)
- **Architecture**: x86_64 (amd64)

## Development

This project was extracted from a customized Omakub fork. The goal is to maintain these enhancements as a separate overlay that can be applied after the standard Omakub installation.

## License

MIT License - see LICENSE file for details.

## Acknowledgments

- [Omakub](https://omakub.org) - The excellent base system this builds upon
- [Basecamp](https://basecamp.com) - For creating and maintaining Omakub
