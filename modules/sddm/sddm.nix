{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  # Create a custom variant of the sddm-astronaut theme
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "japanese_aesthetic"; # Use the Japanese aesthetic subtheme
    themeConfig = {
      Font = "Electroharmonix"; # Explicitly set the font
      # You can add other theme config overrides here if needed
    };
  };
in {
  environment.systemPackages = [
    # Include the custom theme and required Qt packages
    custom-sddm-astronaut
    pkgs.kdePackages.qtsvg
    pkgs.kdePackages.qtmultimedia
    pkgs.kdePackages.qtvirtualkeyboard
    
    # cosmetic
    pkgs.kde-rounded-corners
    inputs.kwin-effects-forceblur.packages.${pkgs.system}.default
  ];

  services = {
    xserver.enable = false;
    desktopManager.plasma6.enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "sddm-astronaut-theme";
      
      # Add the theme package to SDDM's package list
      extraPackages = [
        custom-sddm-astronaut
      ];
      
      # Ensure SDDM uses the correct theme
      settings = {
        Theme = {
          Current = "sddm-astronaut-theme";
        };
      };
    };
  };
}