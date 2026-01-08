{ config, lib, pkgs, ... }:

let
  cfg = config.rain.home.darwin.apps.nvim;
in
{
  options.rain.home.darwin.apps.nvim = {
    enable = lib.mkEnableOption "Enable nvim";
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };
  };
}
