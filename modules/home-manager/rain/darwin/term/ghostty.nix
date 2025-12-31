{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.term.ghostty;
in with lib; {
  options.rain.home.darwin.term.ghostty = {
    enable = mkEnableOption "Enable ghostty";
  };

  config = mkIf cfg.enable {
    xdg.configFile."ghostty/config".text = ''
      # Ghostty Configuration
      # vim:fileencoding=utf-8:foldmethod=marker

      # Font settings
      font-family = Maple Mono NF
      font-size = 12
      adjust-cell-height = 15%
      window-padding-balance = true

      # Font features 
      font-feature = +ss01
      font-feature = +cv03

      # Cursor settings
      cursor-style-blink = false

      # Window settings
      window-decoration = false
      macos-titlebar-style = hidden

      # macOS specific settings
      macos-option-as-alt = true

      # Color space and blending for better colors on macOS
      window-colorspace = display-p3

      # Background effects (transparency and blur)
      background-opacity = 0.8
      background-blur-radius = 20

      # Current theme
      theme = cyberdream 
    '';
    xdg.configFile."ghostty/themes/catppuccin-mocha".source = ../../../../../dotfiles/ghostty/themes/catppuccin-mocha;
    xdg.configFile."ghostty/themes/cyberdream".source = ../../../../../dotfiles/ghostty/themes/cyberdream;
    xdg.configFile."ghostty/themes/oxocarbon".source = ../../../../../dotfiles/ghostty/themes/oxocarbon;
    xdg.configFile."ghostty/themes/tokyonight_night".source = ../../../../../dotfiles/ghostty/themes/tokyonight_night;
  };
}
