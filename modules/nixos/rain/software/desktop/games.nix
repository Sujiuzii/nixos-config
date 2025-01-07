{ config, pkgs, lib, ... }:

let
  cfg = config.rain.software.desktop.games;
in with lib; {
  options = {
    rain.software.desktop.games = {
      enable = mkEnableOption "desktop games application";
    };
  };

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;
    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };
}
