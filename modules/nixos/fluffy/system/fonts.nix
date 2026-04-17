{ lib, pkgs, config, ... }:

let
  cfg = config.fluffy.system.fonts;
in with lib; {
  options = {
    fluffy.system.fonts = {
      enable = mkEnableOption "system fonts";
    };
  };

  # Configure the fonts
  config = mkIf config.fluffy.system.fonts.enable {
    fonts = {
      enableDefaultPackages = true;

      packages = with pkgs; [
        feather

        # icon fonts
        material-design-icons
        font-awesome
        icomoon-feather

        source-han-sans

        # (nerdfonts.override { fonts = [ "Hack" "FiraCode" "JetBrainsMono" "Iosevka" ]; })
        nerd-fonts.hack
        nerd-fonts.fira-code
        nerd-fonts.jetbrains-mono
        nerd-fonts.iosevka
   
        # normal fonts
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
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
