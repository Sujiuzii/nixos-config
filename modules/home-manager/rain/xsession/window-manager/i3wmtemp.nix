{ config, pkgs, lib, outputs, ... }:

{
  windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      i3status
      i3lock-fancy
      i3blocks
      polybar
      rofi
      picom
      flameshot
      nitrogen
    ];

    configFile = /home/suhui/.config/i3/config;
  };
}
