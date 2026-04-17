{ config, lib, pkgs, ... }:

let
  i3Enabled = config.fluffy.home.xsession.window-manager.i3.enable;
  cfg = config.fluffy.home.xsession.window-manager.i3.applet.app-menu;
in with lib; {
  config = mkIf (pkgs.stdenv.isLinux && i3Enabled && cfg == "rofi") {
    programs.rofi.enable = true;
  };
}
