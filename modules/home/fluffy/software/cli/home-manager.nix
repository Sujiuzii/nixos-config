{ config, lib, ... }:

{
  config = lib.mkIf config.fluffy.home.software.cli.enable {
    programs.home-manager.enable = true;
  };
}
