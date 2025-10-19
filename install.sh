#!/bin/bash

# Ocean at Night - Arch Sway Setup Installation Script
# This script installs and configures SwayFX with all visual customizations
# Prerequisites: Fresh Arch install with archinstall + sway selected

set -e  # Exit on error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Functions for pretty output
print_step() {
    echo -e "${BLUE}==>${NC} ${GREEN}$1${NC}"
}

print_warning() {
    echo -e "${YELLOW}Warning:${NC} $1"
}

print_error() {
    echo -e "${RED}Error:${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   print_error "This script should NOT be run as root (don't use sudo)"
   exit 1
fi

# Welcome message
echo ""
echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${NC}  Ocean at Night - Sway Setup Installer  ${BLUE}║${NC}"
echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
echo ""

# Check if paru is installed (AUR helper)
if ! command -v paru &> /dev/null; then
    print_warning "paru AUR helper not found. Installing paru..."

    # Install dependencies for paru
    sudo pacman -S --needed --noconfirm base-devel git

    # Clone and install paru
    cd /tmp
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm
    cd "$SCRIPT_DIR"

    print_success "paru installed successfully"
else
    print_success "paru is already installed"
fi

# Update system
print_step "Updating system packages..."
paru -Syu --noconfirm
print_success "System updated"

# Install packages
print_step "Installing core Sway and Wayland packages..."

# Core packages (that don't require AUR)
CORE_PACKAGES=(
    waybar
    swaybg
    swayidle
    fuzzel
    foot
    grim
    slurp
    wl-clipboard
    pipewire
    pipewire-alsa
    pipewire-pulse
    pipewire-jack
    pipewire-audio
    pavucontrol
    playerctl
    bluez
    bluez-utils
    bluez-libs
    brightnessctl
    polkit
    nwg-displays
    gtk3
    gtk4
    gtk-layer-shell
    xdg-desktop-portal-gtk
    ttf-nerd-fonts-symbols
    ttf-nerd-fonts-symbols-common
    btop
    fastfetch
    zsh
    git
    lazygit
    gh
    rustup
    docker
    docker-compose
    docker-buildx
)

print_step "Installing official repository packages..."
paru -S --needed --noconfirm "${CORE_PACKAGES[@]}"
print_success "Official packages installed"

# AUR packages
AUR_PACKAGES=(
    swayfx-git
    swaylock-effects-git
    swaync-git
)

print_step "Installing AUR packages (this may take a while)..."
paru -S --needed --noconfirm "${AUR_PACKAGES[@]}"
print_success "AUR packages installed"

# Setup Rust toolchain
if ! command -v cargo &> /dev/null; then
    print_step "Setting up Rust toolchain..."
    rustup default stable
    print_success "Rust toolchain installed"
else
    print_success "Rust toolchain already installed"
fi

# Setup PHP via php.new
print_step "Installing PHP via php.new..."
if ! command -v php &> /dev/null; then
    curl -sSL https://php.new/install/linux | bash
    # Add PHP to PATH for current session
    export PATH="$HOME/.local/bin:$PATH"
    print_success "PHP installed via php.new"
else
    print_success "PHP already installed"
fi

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_step "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_success "Oh My Zsh installed"
else
    print_success "Oh My Zsh is already installed"
fi

# Install fonts
print_step "Installing JetBrains Mono Nerd Font..."
mkdir -p "$HOME/.local/share/fonts"

if [ -d "$SCRIPT_DIR/fonts/JetBrainsMono" ]; then
    cp -r "$SCRIPT_DIR/fonts/JetBrainsMono" "$HOME/.local/share/fonts/"
    fc-cache -f -v
    print_success "Fonts installed and cache updated"
else
    print_warning "JetBrainsMono font directory not found in $SCRIPT_DIR/fonts/"
fi

# Copy configurations
print_step "Installing configuration files..."

# Sway
mkdir -p "$HOME/.config/sway"
cp "$SCRIPT_DIR/configs/sway/config" "$HOME/.config/sway/"
print_success "Sway config installed"

# Waybar
mkdir -p "$HOME/.config/waybar"
cp "$SCRIPT_DIR/configs/waybar/config" "$HOME/.config/waybar/"
cp "$SCRIPT_DIR/configs/waybar/style.css" "$HOME/.config/waybar/"
print_success "Waybar config installed"

# Foot
mkdir -p "$HOME/.config/foot"
cp "$SCRIPT_DIR/configs/foot/foot.ini" "$HOME/.config/foot/"
print_success "Foot config installed"

# Alacritty
mkdir -p "$HOME/.config/alacritty"
cp "$SCRIPT_DIR/configs/alacritty/alacritty.toml" "$HOME/.config/alacritty/"
print_success "Alacritty config installed"

# Fuzzel
mkdir -p "$HOME/.config/fuzzel"
cp "$SCRIPT_DIR/configs/fuzzel/fuzzel.ini" "$HOME/.config/fuzzel/"
print_success "Fuzzel config installed"

# Swaylock
mkdir -p "$HOME/.config/swaylock"
cp "$SCRIPT_DIR/configs/swaylock/config" "$HOME/.config/swaylock/"
print_success "Swaylock config installed"

# Zsh (backup existing .zshrc if it exists)
if [ -f "$HOME/.zshrc" ]; then
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
    print_warning "Existing .zshrc backed up"
fi
cp "$SCRIPT_DIR/configs/zsh/.zshrc" "$HOME/"
print_success "Zsh config installed"

# Fastfetch
mkdir -p "$HOME/.config/fastfetch"
cp "$SCRIPT_DIR/configs/fastfetch/config.jsonc" "$HOME/.config/fastfetch/"
print_success "Fastfetch config installed"

# Btop
mkdir -p "$HOME/.config/btop"
cp "$SCRIPT_DIR/configs/btop/btop.conf" "$HOME/.config/btop/"
print_success "Btop config installed"

# Git global ignore
mkdir -p "$HOME/.config/git"
cp "$SCRIPT_DIR/configs/git/ignore" "$HOME/.config/git/"
print_success "Git global ignore installed"

# Change default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    print_step "Changing default shell to zsh..."
    chsh -s $(which zsh)
    print_success "Default shell changed to zsh (will take effect on next login)"
fi

# Setup SSH keys if present
if [ -f "$SCRIPT_DIR/ssh-keys/id_ed25519" ]; then
    print_step "Setting up SSH keys..."
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"

    # Copy SSH keys
    cp "$SCRIPT_DIR/ssh-keys/id_ed25519" "$HOME/.ssh/"
    cp "$SCRIPT_DIR/ssh-keys/id_ed25519.pub" "$HOME/.ssh/"

    # Set correct permissions
    chmod 600 "$HOME/.ssh/id_ed25519"
    chmod 644 "$HOME/.ssh/id_ed25519.pub"

    print_success "SSH keys installed"
    print_warning "Don't forget to add your public key to GitHub/GitLab!"
    print_warning "View your public key: cat ~/.ssh/id_ed25519.pub"
else
    print_warning "No SSH keys found in $SCRIPT_DIR/ssh-keys/"
    print_warning "You can add them later or generate new ones with: ssh-keygen -t ed25519"
fi

# Enable bluetooth service
print_step "Enabling Bluetooth service..."
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
print_success "Bluetooth service enabled"

# Enable pipewire services
print_step "Enabling PipeWire audio services..."
systemctl --user enable --now pipewire.service
systemctl --user enable --now pipewire-pulse.service
print_success "PipeWire services enabled"

# Enable and configure Docker
print_step "Enabling Docker service..."
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Add user to docker group
sudo usermod -aG docker $USER
print_success "Docker service enabled (logout/login required for group permissions)"

# Wallpaper setup
if [ -f "$SCRIPT_DIR/wallpapers/ocean-night-default.jpg" ]; then
    print_step "Installing wallpaper..."
    mkdir -p "$HOME/Pictures/Wallpapers"
    cp "$SCRIPT_DIR/wallpapers/ocean-night-default.jpg" "$HOME/Pictures/Wallpapers/"

    # Update sway config with new wallpaper path
    sed -i "s|output \* bg .*|output * bg $HOME/Pictures/Wallpapers/ocean-night-default.jpg fill|g" "$HOME/.config/sway/config"
    print_success "Wallpaper installed and configured"
else
    print_warning "Default wallpaper not found in $SCRIPT_DIR/wallpapers/"
    print_warning "Please set your wallpaper path in ~/.config/sway/config (line 220)"
fi

# Include files notice
if [ ! -f "/etc/sway/outputs" ]; then
    print_warning "/etc/sway/outputs not found - you may need to create this file for multi-monitor setup"
fi

if [ ! -f "/etc/sway/workspaces" ]; then
    print_warning "/etc/sway/workspaces not found - you may need to create this file for workspace configuration"
fi

# Final message
echo ""
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${NC}       Installation Complete! 🎉          ${GREEN}║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo ""
echo -e "Next steps:"
echo -e "  1. Log out and log back in (or reboot) for all changes to take effect"
echo -e "  2. Update the wallpaper path in ${BLUE}~/.config/sway/config${NC}"
echo -e "  3. Configure multi-monitor setup in ${BLUE}/etc/sway/outputs${NC} (if needed)"
echo -e "  4. Reload Sway with ${BLUE}Mod+Shift+c${NC} after making config changes"
echo ""
echo -e "Key bindings:"
echo -e "  ${BLUE}Mod+Return${NC}      - Open terminal (foot)"
echo -e "  ${BLUE}Mod+d${NC}           - Application launcher (fuzzel)"
echo -e "  ${BLUE}Mod+Shift+q${NC}     - Close window"
echo -e "  ${BLUE}Mod+Shift+e${NC}     - Exit Sway"
echo ""
echo -e "Enjoy your Ocean at Night setup! 🌊🌙"
echo ""
