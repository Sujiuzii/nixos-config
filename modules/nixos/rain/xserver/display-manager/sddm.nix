{ config, lib, pkgs, ... }:

with lib; {
  config = mkIf (config.rain.xserver.display-manager == "sddm") {
    environment.systemPackages = [
      pkgs.rain.sddm-rose-pine
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
