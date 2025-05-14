{ config, pkgs, ... }:
{
  nix.gc = {
    automatic = true;
    dates = "daily"; # or any schedule you prefer
    options = "--max-old-generations 2"; # Keep 2 old + 1 current = 3 total
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.trusted-users = [ "root" "keishi" ];
}