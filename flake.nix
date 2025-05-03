{
  description = "Keishi's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    hyprland-0_46.url = "github:hyprwm/Hyprland?ref=v0.46.2";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, hyprpanel, hyprland-0_46, home-manager, ... }: {
    nixosConfigurations.keishi = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        { nixpkgs.overlays = [
            (final: prev: { hyprland = inputs.hyprland-0_46.packages.${prev.system}.hyprland; })
            inputs.hyprpanel.overlay
          ];
        }
        ./configuration.nix
      ];
    };
  };
}