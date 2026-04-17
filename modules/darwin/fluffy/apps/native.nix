{ lib, config, pkgs, ... }:

let
  cfg = config.fluffy.darwin.apps.native;
in with lib; {
  options.fluffy.darwin.apps.native = {
    enable = mkEnableOption "Enable native nix packages";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
    ];
  };
}
