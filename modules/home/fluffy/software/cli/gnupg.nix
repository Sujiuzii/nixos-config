{ lib, config, ... }:

{
  config = lib.mkIf config.fluffy.home.software.cli.enable {
    programs.gpg = {
      enable = true;
    };

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
  };
}
