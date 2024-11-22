{ config, lib, ... }:

{
  config = lib.mkIf config.rain.home.software.cli.enable {
    programs.git = {
      enable = true;
      userName = "Hui Su";
      userEmail = "daisyhuisu@gmail.com";
    };
  };
}
