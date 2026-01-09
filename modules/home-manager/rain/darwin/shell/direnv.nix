{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.shell.direnv;
in with lib; {
  options.rain.home.darwin.shell.direnv = {
    enable = mkEnableOption "Enable direnv";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}

