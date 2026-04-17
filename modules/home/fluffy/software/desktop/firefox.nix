{ lib, config, ... }:

{
  config = lib.mkIf config.fluffy.home.software.desktop.enable {
    programs.firefox.enable = true;
  };
}
