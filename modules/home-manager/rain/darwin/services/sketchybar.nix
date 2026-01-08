{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.services.sketchybar;
in with lib; {
  options.rain.home.darwin.services.sketchybar = {
    enable = mkEnableOption "Enable sketchybar";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/sketchybar/sketchybarrc".source = sketchybar/sketchybarrc;
    home.file.".config/sketchybar/colors.sh".source = sketchybar/colors.sh;
    home.file.".config/sketchybar/icon_map.sh".source = sketchybar/icon_map.sh;
    home.file.".config/sketchybar/items" = {
      source = sketchybar/items;
      recursive = true;
    };
    home.file.".config/sketchybar/plugins" = {
      source = sketchybar/plugins;
      recursive = true;
    };
  };
}
