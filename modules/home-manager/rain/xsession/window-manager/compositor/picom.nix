{ config, lib, ... }:

let
  cfg = config.rain.home.xsession.window-manager.i3.applet.compositor;
in with lib; {
  config = mkIf (cfg == "picom") {
    services.picom = {
      enable = true;
      fade = true;
      fadeSteps = [
        0.1
        0.1
      ];
      inactiveOpacity = 1;
      activeOpacity = 1;
      opacityRules = [
	"95:class_g  = 'Rofi'"
	"85:name  = 'Startpage Search Results – Mozilla Firefox'"
        "85:name  = 'Mozilla Firefox'"
	"90:class_g  = 'Thunar'"
	"90:class_g  = 'Anki'"
        "85:class_g  = 'kitty'"
        "80:class_g  = 'QQ'"
        "80:class_g  = 'Spotify'"
        "85:class_g  = 'Code'"
        "85:class_g  = 'Qcm'"
      ];
    };
  };
}
