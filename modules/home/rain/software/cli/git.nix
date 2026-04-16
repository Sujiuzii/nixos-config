{ config, lib, ... }:

{
  config = lib.mkIf config.rain.home.software.cli.enable {
    programs.git = {
      enable = true;
      settings.user = {
        name = "Hui Su";
        email = "daisyhuisu@gmail.com";
      };
    };
  };
}
