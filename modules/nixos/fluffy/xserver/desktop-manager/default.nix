{ lib, ... }:

with lib; {
  imports = [
    ./xfce.nix
  ];

  options = {
    fluffy.xserver.desktop-manager = mkOption {
      type = types.enum ["disable" "xfce"];
      default = "disable";
      description = "Choose desktop manager";
    };
  };
}
