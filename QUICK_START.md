# Quick Start Guide

## For Fresh Arch Installation

### Prerequisites
- Fresh Arch Linux installed via `archinstall`
- Sway selected during installation
- Internet connection
- Regular user account (not root)

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/arch-sway-setup.git
   cd arch-sway-setup
   ```

2. **(Optional) Add SSH keys**
   ```bash
   # If you have existing SSH keys, copy them to the ssh-keys folder
   cp ~/.ssh/id_ed25519* ./ssh-keys/
   ```

3. **Run the installer**
   ```bash
   ./install.sh
   ```

4. **Log out and log back in**
   ```bash
   # Or reboot
   sudo reboot
   ```

5. **Done!** Your Ocean at Night setup is ready

### What Gets Installed

- ✅ SwayFX with blur and rounded corners
- ✅ Waybar status bar
- ✅ Foot terminal with transparency
- ✅ Fuzzel application launcher
- ✅ SwayLock screen locker
- ✅ JetBrains Mono Nerd Font
- ✅ PipeWire audio system
- ✅ Bluetooth support
- ✅ Oh My Zsh
- ✅ Rust toolchain
- ✅ All configuration files
- ✅ Wallpaper

### First Steps After Installation

1. **Test the terminal**: Press `Mod+Return` (Windows key + Enter)
2. **Launch apps**: Press `Mod+d` (Windows key + d)
3. **Check wallpaper**: Should automatically use the included ocean wallpaper

### Customization

- **Change wallpaper**: Edit `~/.config/sway/config` line 220
- **Adjust transparency**: Edit `~/.config/foot/foot.ini` - change `alpha=0.85`
- **Modify colors**: All color schemes are at the top of each config file
- **Multi-monitor**: Use `nwg-displays` GUI tool or edit `/etc/sway/outputs`

### Keyboard Shortcuts

Most used:
- `Mod+Return` - Terminal
- `Mod+d` - App launcher
- `Mod+Shift+q` - Close window
- `Mod+1-9` - Switch workspace
- `Mod+f` - Fullscreen

See README.md for complete key binding list.

### Troubleshooting

**Terminal transparency not working?**
- Make sure SwayFX is installed: `paru -Q swayfx-git`

**Icons missing in Waybar?**
- Fonts should be installed automatically, try: `fc-cache -f -v`

**Audio not working?**
- PipeWire services are enabled automatically, check: `systemctl --user status pipewire`

**Need help?**
- Check the full README.md
- Verify configs in `~/.config/sway/`, `~/.config/waybar/`, etc.

### File Locations

```
~/.config/sway/config         # Sway configuration
~/.config/waybar/config       # Waybar modules
~/.config/waybar/style.css    # Waybar styling
~/.config/foot/foot.ini       # Terminal config
~/.config/fuzzel/fuzzel.ini   # Launcher config
~/.config/swaylock/config     # Lock screen config
~/.config/fastfetch/config.jsonc  # System info config
~/.zshrc                      # Shell config
```

### Pushing to GitHub

```bash
cd arch-sway-setup
git init
git add .
git commit -m "Initial commit: Ocean at Night Sway setup"
git remote add origin https://github.com/YOUR_USERNAME/arch-sway-setup.git
git branch -M main
git push -u origin main
```

Enjoy your beautiful Sway setup! 🌊🌙
