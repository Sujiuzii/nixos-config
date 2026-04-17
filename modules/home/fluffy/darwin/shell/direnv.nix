{ config, pkgs, lib, ... }:

let
  cfg = config.fluffy.home.darwin.shell.direnv;
in with lib; {
  options.fluffy.home.darwin.shell.direnv = {
    enable = mkEnableOption "Enable direnv";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}

