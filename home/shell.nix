{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "docker"
      ];
    };

    # Add custom aliases
    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      # Add more aliases here
      nrs = "cd ~/etc/nixos/ && sudo nixos-rebuild switch --flake '.#keishi'";
      ncg = "nix-collect-garbage -d";
      nrst = "cd ~/etc/nixos/ && sudo nixos-rebuild switch --flake '.#keishi' --show-trace";
      cbe = "sudo nix-collect-garbage -d && sudo nix profile wipe-history --profile /nix/var/nix/profiles/system";
    };

    # Extra Zsh configuration
    initContent = ''
      # Source Starship prompt
      eval "$(starship init zsh)"
    '';
  };
}
