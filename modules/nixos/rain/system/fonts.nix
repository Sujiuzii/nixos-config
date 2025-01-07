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
        feather

        # icon fonts
        material-design-icons

        source-han-sans-simplified-chinese

        # (nerdfonts.override { fonts = [ "Hack" "FiraCode" "JetBrainsMono" "Iosevka" ]; })
        nerd-fonts.hack
        nerd-fonts.fira-code
        nerd-fonts.jetbrains-mono
        nerd-fonts.iosevka
   
        # normal fonts
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
      ];
   
      # fontconfig = {
      #   defaultFonts = {
      #     serif = [ "Source Han Serif SC" "Hack" ];
      #     sansSerif = [ "Source Han Sans SC" "Hack" ];
      #     monospace = [ "Hack" ];
      #   };
      # };
    };
  };
}
