{ lib, config, pkgs, ... }:

let
  cfg = config.rain.darwin.apps.native;
in with lib; {
  options.rain.darwin.apps.native = {
    enable = mkEnableOption "Enable native nix packages";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
    ];
  };
}
