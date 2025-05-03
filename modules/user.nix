{ pkgs, ... }:
{
  users.users.keishi = {
    isNormalUser = true;
    description = "keishi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
    shell = pkgs.zsh;
  };
}
