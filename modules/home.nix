{ config, inputs, pkgs, ... }:
{
  imports = [ 
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      keishi = import ../home/default.nix;
    };
  };  
}