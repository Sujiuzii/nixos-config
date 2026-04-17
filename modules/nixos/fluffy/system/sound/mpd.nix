{ config, lib, ... }:

let
  cfg = config.fluffy.system.sound.mpd;
in with lib; {
  options = {
    fluffy.system.sound.mpd = {
      enable = mkEnableOption "mpd";
    };
  };

  config = mkIf cfg.enable {
    services.mpd = {
      enable = true;
      musicDirectory = "/Music";
      user = "mpd";
    };
  };
}
