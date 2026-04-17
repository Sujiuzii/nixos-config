{ config, lib, ... }:

{
  config = lib.mkIf config.fluffy.home.software.cli.enable {
    programs.git = {
      enable = true;
      settings.user = {
        name = "Hui Su";
        email = "daisyhuisu@gmail.com";
      };
    };
  };
}
