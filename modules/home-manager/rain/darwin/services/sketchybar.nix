{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.services.sketchybar;
in with lib; {
  options.rain.home.darwin.services.sketchybar = {
    enable = mkEnableOption "Enable sketchybar";
  };

  config = mkIf cfg.enable {
    xdg.configFile."sketchybar".source = ../../../../../dotfiles/sketchybar;
  };
}
