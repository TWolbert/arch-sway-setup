# Ocean at Night - Arch Sway Setup

A beautiful, minimalist Arch Linux setup featuring SwayFX with the "Ocean at Night" color theme. This repository contains all configuration files and an automated installation script to recreate this setup on a fresh Arch installation.

![Theme: Ocean at Night](https://img.shields.io/badge/Theme-Ocean%20at%20Night-1e3a5f?style=for-the-badge)
![WM: SwayFX](https://img.shields.io/badge/WM-SwayFX-0a1628?style=for-the-badge)
![Shell: Zsh](https://img.shields.io/badge/Shell-Zsh-2a5f8f?style=for-the-badge)

## 🌊 Theme Overview

**Ocean at Night** is a custom dark theme inspired by deep ocean waters at nighttime. It features:
- Deep blue backgrounds (#0a1628)
- Soft cyan accents (#89dceb)
- Semi-transparent terminals with blur effects
- Rounded corners (10px radius)
- Minimalist, borderless windows
- Two-island status bar layout

## 📦 What's Included

### Window Manager & Compositor
- **SwayFX** - Tiling Wayland compositor with blur and rounded corner effects
- **Waybar** - Highly customizable status bar with system monitoring
- **swaybg** - Wallpaper manager
- **swayidle** - Idle management daemon
- **swaylock-effects** - Screen locker with blur effects

### Applications
- **Foot** - Primary terminal emulator (lightweight, fast)
- **Alacritty** - Alternative terminal (configured but optional)
- **Fuzzel** - Application launcher
- **SwayNC** - Notification daemon

### Utilities
- **grim** - Screenshot utility
- **slurp** - Region selector for screenshots
- **wl-clipboard** - Clipboard manager
- **brightnessctl** - Brightness control
- **playerctl** - Media player controls

### Audio & Bluetooth
- **PipeWire** - Modern audio server with ALSA/PulseAudio/JACK support
- **pavucontrol** - GUI volume control
- **bluez** - Bluetooth stack

### Fonts
- **JetBrains Mono Nerd Font** - Primary font with icon support
- **Nerd Fonts Symbols** - Icon fonts for waybar

### Shell
- **Zsh** with Oh My Zsh
- **af-magic** theme
- Optimized with lazy-loading for fast startup

## 🚀 Installation

### Prerequisites

1. Fresh Arch Linux installation using `archinstall` with:
   - Sway desktop selected during installation
   - A regular user account (not root)
   - Internet connection

### Quick Install

```bash
# Clone this repository
git clone https://github.com/YOUR_USERNAME/arch-sway-setup.git
cd arch-sway-setup

# Run the installation script
./install.sh
```

The script will:
1. Install paru (AUR helper) if not present
2. Update your system
3. Install all required packages
4. Install Oh My Zsh
5. Copy all configuration files
6. Install JetBrains Mono Nerd Font
7. Set up audio (PipeWire) and Bluetooth services
8. Change default shell to Zsh

### Post-Installation

1. **SSH Keys** (Optional): Add your SSH keys to `ssh-keys/` folder before running the installer
   ```bash
   cp ~/.ssh/id_ed25519* ./ssh-keys/
   ```
   The installer will automatically set them up. See `ssh-keys/README.md` for details.

2. **Wallpaper**: Wallpaper is auto-configured. To change it, edit `~/.config/sway/config` (line 220)
   ```bash
   output * bg /path/to/your/wallpaper.jpg fill
   ```

3. **Multi-monitor setup**: Create `/etc/sway/outputs` if you have multiple monitors
   ```bash
   sudo nano /etc/sway/outputs
   # Add your monitor configuration, for example:
   # output HDMI-A-1 resolution 1920x1080 position 1920,0
   ```

4. **Log out and log back in** for all changes to take effect

5. **Reload Sway**: Press `Mod+Shift+c` to reload the configuration

## ⌨️ Key Bindings

### Basic Controls
| Keys | Action |
|------|--------|
| `Mod + Return` | Open terminal (Foot) |
| `Mod + d` | Application launcher (Fuzzel) |
| `Mod + Shift + q` | Close focused window |
| `Mod + Shift + c` | Reload Sway configuration |
| `Mod + Shift + e` | Exit Sway |

### Window Navigation
| Keys | Action |
|------|--------|
| `Mod + h/j/k/l` | Move focus (Vim keys) |
| `Mod + Arrow Keys` | Move focus (Arrow keys) |
| `Mod + Shift + h/j/k/l` | Move window |
| `Mod + Shift + Arrow Keys` | Move window |

### Workspaces
| Keys | Action |
|------|--------|
| `Mod + 1-0` | Switch to workspace 1-10 |
| `Mod + Shift + 1-0` | Move window to workspace 1-10 |

### Layout
| Keys | Action |
|------|--------|
| `Mod + b` | Split horizontal |
| `Mod + v` | Split vertical |
| `Mod + s` | Stacking layout |
| `Mod + w` | Tabbed layout |
| `Mod + e` | Toggle split layout |
| `Mod + f` | Fullscreen |
| `Mod + Shift + Space` | Toggle floating |
| `Mod + Space` | Toggle focus tiling/floating |
| `Mod + r` | Resize mode |

### Scratchpad
| Keys | Action |
|------|--------|
| `Mod + Shift + -` | Move to scratchpad |
| `Mod + -` | Show/cycle scratchpad |

## 🎨 Color Scheme

```
Background:        #0a1628
Inactive BG:       #0f1e33
Text:              #c5d9ed
Inactive Text:     #6b8ba8
Urgent:            #1a4d7a
Indicator:         #2a5f8f
Ocean Blue:        #1e3a5f
Deep Blue:         #152238

Accent Colors:
Red:               #e74c3c
Cyan:              #89dceb
Yellow:            #f9e2af
Green:             #a6e3a1
Magenta:           #b4a0e5
```

## 📁 File Structure

```
arch-sway-setup/
├── install.sh                 # Main installation script
├── README.md                  # This file
├── packages.txt               # List of all packages
├── configs/
│   ├── sway/
│   │   └── config             # Sway configuration
│   ├── waybar/
│   │   ├── config             # Waybar modules config
│   │   └── style.css          # Waybar styling
│   ├── foot/
│   │   └── foot.ini           # Foot terminal config
│   ├── alacritty/
│   │   └── alacritty.toml     # Alacritty config
│   ├── fuzzel/
│   │   └── fuzzel.ini         # Fuzzel launcher config
│   ├── swaylock/
│   │   └── config             # Swaylock config
│   ├── zsh/
│   │   └── .zshrc             # Zsh configuration
│   └── fastfetch/
│       └── config.jsonc       # Fastfetch configuration
├── fonts/
│   └── JetBrainsMono/         # JetBrains Mono Nerd Font files
├── wallpapers/                # Wallpaper images
│   └── ocean-night-default.jpg
└── ssh-keys/                  # SSH keys (git-ignored for security)
    └── README.md              # Instructions for SSH key setup
```

## 🔧 Customization

### Changing the Color Theme

All colors are defined at the top of each config file:

- **Sway**: `~/.config/sway/config` (lines 8-15)
- **Waybar CSS**: `~/.config/waybar/style.css`
- **Foot**: `~/.config/foot/foot.ini` ([colors] section)
- **Fuzzel**: `~/.config/fuzzel/fuzzel.ini` ([colors] section)
- **Swaylock**: `~/.config/swaylock/config`

### Adjusting Transparency

Terminal transparency can be adjusted in:
- **Foot**: `~/.config/foot/foot.ini` - Change `alpha=0.85`
- **Alacritty**: `~/.config/alacritty/alacritty.toml` - Change `opacity = 0.85`

### Modifying Waybar Modules

Edit `~/.config/waybar/config` to add/remove modules. Available modules include:
- CPU, memory, temperature monitoring
- Network status
- Audio (PulseAudio)
- Power profiles
- Clock
- System tray

## 📊 Waybar Features

Current modules (left to right):
- **Left**: Workspaces, mode indicator, scratchpad
- **Center**: Active window title
- **Right**: Audio, network, power profile, CPU, memory, temperature, clock, system tray

Icons are from Nerd Fonts and display:
- Numbered workspace icons
- Application-specific window titles (Firefox, VS Code, etc.)
- System status indicators

## 🐛 Troubleshooting

### Terminal transparency not working
Make sure SwayFX is installed (not regular Sway):
```bash
paru -Q swayfx-git
```

### Icons not showing in Waybar
Install Nerd Fonts symbols:
```bash
paru -S ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common
```

### Audio not working
Enable and start PipeWire services:
```bash
systemctl --user enable --now pipewire pipewire-pulse
```

### Bluetooth not working
Enable and start Bluetooth service:
```bash
sudo systemctl enable --now bluetooth
```

### SwayFX effects not working
Check that blur is enabled in Sway config for specific windows:
```
for_window [app_id="foot"] blur enable
```

## 📝 Manual Installation

If you prefer to install manually without the script:

1. Install paru (AUR helper)
2. Install packages from `packages.txt`
3. Copy config files from `configs/` to `~/.config/`
4. Copy fonts from `fonts/` to `~/.local/share/fonts/`
5. Run `fc-cache -f -v` to update font cache
6. Copy `.zshrc` to your home directory
7. Install Oh My Zsh
8. Change shell: `chsh -s $(which zsh)`
9. Enable services: bluetooth, pipewire

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📜 License

This configuration is free to use and modify. No warranty provided.

## 🙏 Credits

- **SwayFX** - WillPower3309
- **Waybar** - Alexays
- **Foot** - Daniel Eklöf
- **Fuzzel** - Daniel Eklöf
- **JetBrains Mono** - JetBrains
- **Nerd Fonts** - Ryan L McIntyre

---

**Enjoy your Ocean at Night setup!** 🌊🌙
