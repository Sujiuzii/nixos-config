{ config, lib, pkgs, ... }:

let
  i3Enabled = config.rain.home.xsession.window-manager.i3.enable;
  cfg = config.rain.home.xsession.window-manager.i3.applet.app-menu;
in with lib; {
  config = mkIf (pkgs.stdenv.isLinux && i3Enabled && cfg == "rofi") {
    programs.rofi.enable = true;
  };
}
