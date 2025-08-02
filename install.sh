#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors for output  
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_header() {
    echo -e "\n${BLUE}=== $1 ===${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Check if omakub is already installed
check_omakub_installation() {
    if ! command -v omakub &> /dev/null; then
        print_error "Omakub is not installed. Please install the base omakub first:"
        echo "  curl -fsSL https://omakub.org/install | bash"
        exit 1
    fi
    print_success "Base omakub installation found"
}

# Main installation menu
show_menu() {
    clear
    echo -e "${BLUE}"
    cat << "EOF"
╔═══════════════════════════════════════════════════════════════╗
║                     POST-OMAKUB SETUP                        ║
║                                                               ║
║           Additional apps and customizations for             ║
║                  your omakub installation                    ║
╚═══════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
    
    echo "Select what to install:"
    echo
    echo "1) Install additional applications"
    echo "2) Setup security hardening (SSH + UFW)"
    echo "3) Enhance Chrome theme integration"
    echo "4) Setup terminal/GNOME enhancements"
    echo "5) Remove unwanted default apps"
    echo "6) Install everything"
    echo "7) Exit"
    echo
    read -p "Choose an option (1-7): " choice
    
    case $choice in
        1) install_applications ;;
        2) setup_security ;;
        3) setup_chrome_themes ;;
        4) setup_desktop_enhancements ;;
        5) remove_unwanted_apps ;;
        6) install_everything ;;
        7) exit 0 ;;
        *) echo "Invalid option. Please try again." && sleep 2 && show_menu ;;
    esac
}

install_applications() {
    print_header "Installing Additional Applications"
    
    # Source application installers
    for app_script in "$SCRIPT_DIR"/install/apps/*.sh; do
        if [[ -f "$app_script" ]]; then
            if gum confirm "Install $(basename "$app_script" .sh | sed 's/app-//')? "; then
                print_success "Installing $(basename "$app_script")..."
                bash "$app_script"
            fi
        fi
    done
    
    print_success "Application installation completed!"
    read -p "Press Enter to return to menu..."
    show_menu
}

setup_security() {
    print_header "Setting up Security Hardening"
    
    if gum confirm "Setup SSH daemon and UFW firewall?"; then
        bash "$SCRIPT_DIR/install/security/security-setup.sh"
        print_success "Security setup completed!"
    fi
    
    read -p "Press Enter to return to menu..."  
    show_menu
}

setup_chrome_themes() {
    print_header "Setting up Chrome Theme Integration"
    
    if gum confirm "Setup Chrome theme integration for all omakub themes?"; then
        bash "$SCRIPT_DIR/install/themes/setup-chrome-themes.sh"
        print_success "Chrome theme integration completed!"
    fi
    
    read -p "Press Enter to return to menu..."
    show_menu
}

setup_desktop_enhancements() {
    print_header "Setting up Desktop Enhancements"
    
    bash "$SCRIPT_DIR/install/desktop/setup-enhancements.sh"
    print_success "Desktop enhancements completed!"
    
    read -p "Press Enter to return to menu..."
    show_menu
}

remove_unwanted_apps() {
    print_header "Removing Unwanted Applications"
    
    for uninstall_script in "$SCRIPT_DIR"/uninstall/*.sh; do
        if [[ -f "$uninstall_script" ]]; then
            app_name=$(basename "$uninstall_script" .sh | sed 's/app-//')
            if gum confirm "Remove $app_name?"; then
                bash "$uninstall_script"
                print_success "Removed $app_name"
            fi
        fi
    done
    
    print_success "Application removal completed!"
    read -p "Press Enter to return to menu..."
    show_menu
}

install_everything() {
    print_header "Installing Everything"
    
    if gum confirm "This will install all additional apps, security hardening, and enhancements. Continue?"; then
        # Install all applications non-interactively
        for app_script in "$SCRIPT_DIR"/install/apps/*.sh; do
            if [[ -f "$app_script" ]]; then
                print_success "Installing $(basename "$app_script")..."
                bash "$app_script"
            fi
        done
        
        # Setup security
        bash "$SCRIPT_DIR/install/security/security-setup.sh"
        
        # Setup Chrome themes  
        bash "$SCRIPT_DIR/install/themes/setup-chrome-themes.sh"
        
        # Setup desktop enhancements
        bash "$SCRIPT_DIR/install/desktop/setup-enhancements.sh"
        
        print_success "Full installation completed!"
    fi
    
    read -p "Press Enter to return to menu..."
    show_menu
}

# Main execution
main() {
    # Check if gum is available (should be from omakub)
    if ! command -v gum &> /dev/null; then
        print_error "gum is not available. Please ensure omakub is properly installed."
        exit 1
    fi
    
    check_omakub_installation
    show_menu
}

# Run main function
main "$@"