{ config, pkgs, lib, ... }: 
{
  imports = [
    ./packages.nix          # User packages
    ./shell.nix
    ./git.nix
    ./starship.nix
    ./desktop/kitty.nix # Example import for a desktop app
    # Add imports for other desktop modules like hyprland.nix here
  ];

  home = {
    username = "keishi";
    homeDirectory = "/home/keishi";
    stateVersion = "24.11";
  };
  
  # Enable Home Manager
  programs.home-manager.enable = true;
}