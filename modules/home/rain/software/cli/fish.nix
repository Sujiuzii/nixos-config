{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.rain.home.software.cli.enable {
    programs.fish = {
      enable = true;
      shellAliases = {
        ds = "sgpt";
        clash-proxy = "http_proxy=127.0.0.1:7890 https_proxy=127.0.0.1:7890";
      };
      shellInit = ''
        set -gx TERM xterm-256color
      '';
    };
  };
}
