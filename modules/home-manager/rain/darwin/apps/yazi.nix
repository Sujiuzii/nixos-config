{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.apps.yazi;
in with lib; {
  options.rain.home.darwin.apps.yazi = {
    enable = mkEnableOption "Enable yazi";
  };

  config = mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        manager = {
          ratio = [ 1 4 3 ];
          sort_by = "mtime";
          sort_sensitive = false;
          sort_reverse = true;
          sort_dir_first = false;
        };
        preview = {
          tab_size = 2;
          max_width = 600;
          max_height = 900;
        };
      };
    };
    xdg.configFile."yazi/keymap.toml".source = yazi/keymap.toml;
    xdg.configFile."yazi/theme.toml".source = yazi/theme.toml;
  };
}
