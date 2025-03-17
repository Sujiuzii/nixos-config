{ config, lib, outputs, pkgs, ... }:

let
  cfg = config.rain.software.desktop.applications;
in with lib; {
  options = {
    rain.software.desktop.applications = {
      enable = mkEnableOption "desktop application";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # office
      qq
      libreoffice
      wemeet

      # video
      obs-studio

      # graphics
      gimp

      # tty & rdp
      putty
      remmina

      nitrogen
      (rizin.withPlugins (ps: with ps; [
        rz-ghidra
        sigdb
      ]))

    ];

    # Enable flatpak for all users
    services.flatpak.enable = true;
    xdg.portal = {
      enable = true;
      # for now, simply use flatpak verison < 1.17
      config.common.default = "*";
    };

    # Used by VS Code
    services.gnome.gnome-keyring.enable = true;
  };
}
