{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.term.kitty;
in with lib; {
  options.rain.home.darwin.term.kitty = {
    enable = mkEnableOption "Enable kitty";
  };

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      settings = {
        font_family = "Maple Mono NF";
        bold_font = "Maple Mono NF Bold";
        italic_font = "Maple Mono NF Italic";
        bold_italic_font = "Maple Mono NF Bold Italic";
        font_size = 12.0;
        adjust_line_height = "115%";
        cursor_blink_interval = 0;
        hide_window_decorations = "titlebar-only";
        macos_option_as_alt = "yes";
        text_composition_strategy = "legacy";
        macos_colorspace = "displayp3";
        background_opacity = 0.8;
        background_blur = 20;
      };
      extraConfig = ''
        include ./current-theme.conf
        # Adding font features
        font_features MapleMono-NF-Regular +ss01 +cv03
        font_features MapleMono-NF-Bold +ss01 +cv03
        font_features MapleMono-NF-Italic +ss01 +cv03
        font_features MapleMono-NF-BoldItalic +ss01 +cv03
      '';
    };
    xdg.configFile."kitty/catppuccin-theme.conf".source = kitty/catppuccin-theme.conf;
    xdg.configFile."kitty/current-theme.conf".source = kitty/current-theme.conf;
    xdg.configFile."kitty/cyberdream.conf".source = kitty/cyberdream.conf;
    xdg.configFile."kitty/oxocarbon.conf".source = kitty/oxocarbon.conf;
    xdg.configFile."kitty/toggle-transparency.sh".source = kitty/toggle-transparency.sh;
    xdg.configFile."kitty/tokyonight_day.conf".source = kitty/tokyonight_day.conf;
    xdg.configFile."kitty/tokyonight_moon.conf".source = kitty/tokyonight_moon.conf;
    xdg.configFile."kitty/tokyonight_night.conf".source = kitty/tokyonight_night.conf;
    xdg.configFile."kitty/tokyonight_storm.conf".source = kitty/tokyonight_storm.conf;
  };
}
