{ config, lib, pkgs, ... }:

let
  i3Enabled = config.rain.home.xsession.window-manager.i3.enable;
  cfg = config.rain.home.xsession.window-manager.i3.applet.screensaver;
in with lib; {
  config = mkIf (pkgs.stdenv.isLinux && i3Enabled && cfg == "i3lock-fancy") {
    home.packages = [
      pkgs.i3lock-fancy
    ];

    services.screen-locker = {
      enable = true;
      inactiveInterval = 10000;
      lockCmd = "${pkgs.i3lock-fancy}/bin/i3lock-fancy";
      xautolock.enable = true;
    };
  };
}
