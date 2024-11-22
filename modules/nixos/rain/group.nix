{ lib, config, pkgs, ... }:

let
  cfg = config.rain.group;
in with lib; {
  options = {
    rain.group = {
      openvpn.enable = mkEnableOption "group openvpn";
    };
  };

  config = mkIf cfg.openvpn.enable {
    users.groups = {
      openvpn = { };
    };
  };
}
