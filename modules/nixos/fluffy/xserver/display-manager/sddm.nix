{ config, lib, pkgs, ... }:

with lib; {
  config = mkIf (config.fluffy.xserver.display-manager == "sddm") {
    environment.systemPackages = [
      pkgs.fluffy.sddm-rose-pine
    ];

    services.displayManager = {
      defaultSession = "xfce+i3";
      sddm = {
        enable = true;
        theme = "rose-pine";
      };
    };
  };
}
