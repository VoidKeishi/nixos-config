{ pkgs, ... }:
{
  programs.zsh.enable = true;
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    brave
    kitty
    obsidian
    slack
    teams-for-linux
    hyprpanel
    rofi
    xdg-desktop-portal-hyprland
    xdg-desktop-portal
    (pkgs.callPackage ./sddm/font.nix { sddmAstronautTheme = pkgs.callPackage ./sddm/theme.nix {}; })
  ];

  virtualisation.vmware.host.enable = true;
}