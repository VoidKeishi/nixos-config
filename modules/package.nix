{ pkgs, ... }:
{
  programs.zsh.enable = true;
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
  };

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
    xdg-desktop-portal
  ];

  virtualisation.vmware.host.enable = true;
}