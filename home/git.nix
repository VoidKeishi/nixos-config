{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "VoidKeishi"; # Replace with your actual name
    userEmail = "phananha4@gmail.com"; # Replace with your actual email
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Lazygit configuration (optional)
  programs.lazygit = {
    enable = true;
    # settings = { ... }; # Add custom lazygit settings if needed
  };
}