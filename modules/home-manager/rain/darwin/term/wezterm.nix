{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.term.wezterm;
in with lib; {
  options.rain.home.darwin.term.wezterm = {
    enable = mkEnableOption "Enable wezterm";
  };

  config = mkIf cfg.enable {
    programs.wezterm = {
      enable = true;
      extraConfig = builtins.readFile ../../../../../dotfiles/wezterm/wezterm.lua;
    };
  };
}
