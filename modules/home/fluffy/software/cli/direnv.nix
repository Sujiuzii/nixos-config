{ config, lib, ... }:

{
  config = lib.mkIf config.fluffy.home.software.cli.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
