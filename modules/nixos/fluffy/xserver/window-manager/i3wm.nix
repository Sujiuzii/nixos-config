{ config, lib, ... }:

with lib; {
  config = mkIf (config.fluffy.xserver.window-manager == "i3") {
    services.xserver.windowManager.i3.enable = true;
  };
}
