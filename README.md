# Post-Omakub Setup

A collection of additional applications, security enhancements, and customizations to run after installing the base [Omakub](https://omakub.org) system.

## Overview

This project provides a curated set of enhancements that build on top of the standard Omakub installation, including:

- **Additional Applications**: LastPass, pCloud, Discord, Mailspring, PIA VPN
- **Security Hardening**: SSH daemon and UFW firewall configuration
- **Chrome Theme Integration**: Enhanced theme support for all Omakub themes
- **Desktop Enhancements**: Improved terminal and GNOME configurations
- **Cleanup Tools**: Remove unwanted default applications

## Prerequisites

- **Omakub must already be installed** - Install from [omakub.org](https://omakub.org)
- Ubuntu 22.04+ or compatible Linux distribution
- Internet connection for downloading applications

## Quick Start

```bash
# Clone this repository
git clone https://github.com/yourusername/post-omakub.git
cd post-omakub

# Run the interactive installer
./install.sh
```

## What's Included

### 🚀 Additional Applications

| Application | Description | Installation Script |
|-------------|-------------|-------------------|
| **LastPass** | Password manager with Chrome extension auto-install | `install/apps/app-lastpass.sh` |
| **pCloud** | Cloud storage client | `install/apps/app-pcloud.sh` |
| **Discord** | Enhanced Discord installation | `install/apps/app-discord.sh` |
| **Mailspring** | Modern email client | `install/apps/app-mailspring.sh` |
| **PIA VPN** | Private Internet Access VPN client | `install/apps/app-pia-vpn.sh` |

### 🔒 Security Enhancements

- **SSH Daemon**: Automatically enabled and configured
- **UFW Firewall**: Enabled with SSH access configured
- Located in: `install/security/security-setup.sh`

### 🎨 Chrome Theme Integration

Extends Omakub's theme system to include Chrome browser theming:
- Integrates with all existing Omakub themes
- Automatically applies Chrome themes when switching Omakub themes
- Custom background and color scheme support

### 🖥️ Desktop Enhancements

- **Default Terminal Configuration**: Enhanced terminal setup
- **GNOME Terminal Profiles**: Improved terminal profiles
- **Better Integration**: Seamless desktop experience

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
# Choose option 6 from the menu
```

### Manual Installation
Run individual components:

```bash
# Security hardening only
bash install/security/security-setup.sh

# Chrome theme integration only  
bash install/themes/setup-chrome-themes.sh

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
├── install.sh                          # Main interactive installer
├── install/
│   ├── apps/                           # Additional applications
│   │   ├── app-lastpass.sh
│   │   ├── app-pcloud.sh
│   │   ├── app-discord.sh
│   │   ├── app-mailspring.sh
│   │   └── app-pia-vpn.sh
│   ├── security/
│   │   └── security-setup.sh           # SSH + UFW setup
│   ├── themes/
│   │   ├── setup-chrome-themes.sh      # Chrome theme integration
│   │   ├── set-chrome-theme.sh         # Chrome theme setter
│   │   └── chrome-configs/             # Per-theme Chrome configs
│   └── desktop/
│       ├── setup-enhancements.sh       # Desktop enhancement setup
│       ├── set-default-terminal.sh     # Terminal configuration
│       └── set-gnome-terminal-profile.sh
└── uninstall/                          # Application removal scripts
    ├── app-basecamp.sh
    ├── app-hey.sh
    ├── app-typora.sh
    ├── app-spotify.sh
    ├── app-zoom.sh
    └── app-dropbox.sh
```

## Compatibility

- **Base System**: Requires Omakub to be installed first
- **Ubuntu**: 22.04+ (same as Omakub requirements)
- **Architecture**: x86_64 (amd64)

## Development

This project was extracted from a customized Omakub fork. The goal is to maintain these enhancements as a separate overlay that can be applied after the standard Omakub installation.

### Contributing

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## Security

All scripts in this project follow security best practices:
- No hardcoded credentials
- Proper file permissions
- Safe download methods
- User confirmation for destructive actions

## License

MIT License - see LICENSE file for details.

## Acknowledgments

- [Omakub](https://omakub.org) - The excellent base system this builds upon
- [Basecamp](https://basecamp.com) - For creating and maintaining Omakub