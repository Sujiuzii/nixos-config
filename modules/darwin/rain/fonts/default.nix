{ lib, config, pkgs, ... }:

let
  cfg = config.rain.darwin.fonts;
in with lib; {
  options.rain.darwin.fonts = {
    enable = mkEnableOption "Enable fonts";
  };

  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [ maple-mono.NF ];
  };
}
