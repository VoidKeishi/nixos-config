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
      export MAMBA_EXE='/nix/store/jy1g89hgafda3nbsgikmgxx0ifp0arzr-micromamba-1.5.8/bin/micromamba';
      export MAMBA_ROOT_PREFIX='/home/keishi/micromamba';
      __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__mamba_setup"
      else
          alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
      fi
      unset __mamba_setup
    '';
  };
}
