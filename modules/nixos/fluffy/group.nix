{ lib, config, pkgs, ... }:

let
  cfg = config.fluffy.group;
in with lib; {
  options = {
    fluffy.group = {
      openvpn.enable = mkEnableOption "group openvpn";
    };
  };

  config = mkIf cfg.openvpn.enable {
    users.groups = {
      openvpn = { };
    };
  };
}
