{ config, lib, ... }:

with lib; {
  config = mkIf (config.fluffy.xserver.display-manager == "gdm") {
    services.xserver.displayManager = {
      gdm.enable = true;
      defaultSession = "none+i3";
    };
  };
}
