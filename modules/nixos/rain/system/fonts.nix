{ lib, pkgs, config, ... }:

let
  cfg = config.rain.system.fonts;
in with lib; {
  options = {
    rain.system.fonts = {
      enable = mkEnableOption "system fonts";
    };
  };

  # Configure the fonts
  config = mkIf config.rain.system.fonts.enable {
    fonts = {
      enableDefaultPackages = true;

      packages = with pkgs; [
        # icon fonts
        material-design-icons

        source-han-sans-simplified-chinese
        (nerdfonts.override { fonts = [ "Hack" ]; })
   
        # normal fonts
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
   
        # nerdfonts
        (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
      ];
   
      fontconfig = {
        defaultFonts = {
          serif = [ "Source Han Serif SC" "Hack" ];
          sansSerif = [ "Source Han Sans SC" "Hack" ];
          monospace = [ "Hack" ];
        };
      };
    };
  };
}
