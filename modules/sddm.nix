{ config, pkgs, ... }:
let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "japanese_aesthetic";
    themeIni = {
      General = {
        background = "${pkgs.writeText "bg" ''/etc/sddm/nix-snowflake.png''}";
        backgroundMode = "fill";
        font = "Electroharmonix";
      };
    };
  };
in {
  environment.systemPackages = [
    custom-sddm-astronaut
    pkgs.kdePackages.qtsvg
    pkgs.kdePackages.qtmultimedia
    pkgs.kdePackages.qtvirtualkeyboard
  ];

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "astronaut";
    extraPackages = [ custom-sddm-astronaut ];
    settings = { Theme.Current = "astronaut"; };
  };
}
