{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      format = lib.concatStrings [
        "[](color_red)"
        "$os"
        "[](bg:color_orange fg:color_red)"
        "$directory"
        "[](fg:color_orange bg:color_yellow)"
        "$git_branch"
        "[](fg:color_yellow bg:color_green)"
        "$git_status"
        "[](fg:color_green bg:color_aqua)"
        "$nix_shell"
        "[](fg:color_aqua bg:color_blue)"
        "$cmd_duration"
        "[](fg:color_blue bg:color_purple)"
        "$time"
        "[](fg:color_purple)"
      ];

      palette = "tokyo_night";
      palettes.tokyo_night = {
        color_fg_light = "#c0caf5";   # For dark backgrounds
        color_fg_dark  = "#3b4261";   # For light backgrounds

        color_red    = "#f7768e";
        color_orange = "#ff9e64";
        color_yellow = "#e0af68";
        color_green  = "#9ece6a";
        color_aqua   = "#2ac3de";
        color_blue   = "#7aa2f7";
        color_purple = "#bb9af7";

        color_bg1    = "#1a1b26";
        color_bg2    = "#292e42";
        color_bg3    = "#414868";
      };

      os = {
        disabled = false;
        style = "bg:color_red bold fg:color_fg_dark";
        symbols = {
          NixOS = " ";
        };
      };

      directory = {
        style = "bold fg:color_fg_dark bg:color_orange";
        format = "[ $path ]($style)";
        truncation_length = 3;
      };

      git_branch = {
        symbol = "";
        style = "bg:color_yellow";
        format = "[[ $symbol $branch ](bold fg:color_fg_dark bg:color_yellow)]($style)";
      };

      git_status = {
        style = "bg:color_green bold fg:color_fg_dark";
        format = "[$all_status$ahead_behind]($style)";
      };

      nix_shell = {
        format = "[ via nix $name ]($style)";
        style = "bg:color_aqua bold fg:color_fg_dark";
      };

      cmd_duration = {
        format = "[ 󰔛 $duration ]($style)";
        disabled = false;
        style = "bg:color_blue bold fg:color_fg_dark";
        show_notifications = false;
        min_time_to_notify = 60000;
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:color_purple";
        format = "[[   $time ](bold fg:color_fg_dark bg:color_purple)]($style)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[  ](bold fg:color_green)";
        error_symbol = "[  ](bold fg:color_red)";
      };
    };
  };
}