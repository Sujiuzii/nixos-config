{ config, lib, ... }:

{
  config = lib.mkIf config.rain.home.software.cli.enable {
    programs.home-manager.enable = true;
  };
}
