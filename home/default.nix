{ config, pkgs, lib, ... }: 
{
  imports = [
    ./packages.nix          # User packages
    ./shell.nix
    ./git.nix
    ./starship.nix
    ./kitty.nix
  ];

  home = {
    username = "keishi";
    homeDirectory = "/home/keishi";
    stateVersion = "24.11";
  };
  
  # Enable Home Manager
  programs.home-manager.enable = true;
}