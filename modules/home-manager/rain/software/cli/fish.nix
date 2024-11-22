{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.rain.home.software.cli.enable {
    programs.fish = {
      enable = true;
      shellAliases = {
        nixos-update = "sudo nixos-rebuild switch -v";
        nixos-edit = "cd /etc/nixos; sudo vim /etc/nixos/flake.nix; cd -;";
      };
    };
  };
}
