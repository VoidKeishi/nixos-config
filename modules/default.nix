{ config, pkgs, ... }: {
  imports = [
    ./sddm/sddm.nix
    ./bootloader.nix
    ./locales.nix
    ./network.nix
    ./audio.nix
    ./home.nix
    ./package.nix
    ./service.nix
    ./setting.nix
    ./user.nix
  ];
}