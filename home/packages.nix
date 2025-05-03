{
  config,
  pkgs,
  lib,
  ...
}: {
  # List of packages to install for the user
  home.packages = with pkgs; [
    # Utilities
    btop # System monitor
    fastfetch # System info tool
    ripgrep # Fast grep alternative
    fd # Find alternative
    fzf # Fuzzy finder
    lazygit # TUI for git
    unzip
    wget
    # Fonts (ensure noto-fonts-cjk-sans is included if needed for CJK)
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
  ];

  # Font configuration
  fonts.fontconfig.enable = true;
}