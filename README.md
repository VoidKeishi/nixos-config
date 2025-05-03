# Keishi's NixOS Configuration

This repository contains my personal NixOS system configuration, managed with [Nix flakes](https://nixos.wiki/wiki/Flakes) and [Home Manager](https://nix-community.github.io/home-manager/).

## Structure
```
.
├── flake.nix                  # Flake entry point
├── configuration.nix          # Main system config, imports modules
├── hardware-configuration.nix # Hardware config (auto-generated)
├── modules/                   # System modules (audio, bootloader, etc.)
│   ├── default.nix            # Imports all system modules
│   ├── sddm/                  # SDDM config and theme
│   └── ...                    # Other system modules
└── home/                      # Home Manager user config
    ├── default.nix            # Main user config, imports modules
    ├── packages.nix           # User packages
    ├── shell.nix              # Zsh and shell config
    ├── starship.nix           # Starship prompt config
    └── desktop/               # Desktop app configs (e.g., kitty)
```

## Usage
1. **Edit your configuration** in the appropriate module or home file.
2. **Rebuild your system** with:
   ```sh
   sudo nixos-rebuild switch --flake .#keishi 
   ```

## Notes
- System-level settings are in `modules/`.
- User-level (dotfiles, apps) are in `home/` and managed by Home Manager.
- SDDM theming and custom overlays are included.

---
Feel free to explore and adapt for your own NixOS setup!
