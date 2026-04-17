{ lib, config, pkgs, ... }:

let
  cfg = config.fluffy.darwin.fonts;
in with lib; {
  options.fluffy.darwin.fonts = {
    enable = mkEnableOption "Enable fonts";
  };

  config = mkIf cfg.enable {
    fonts.packages = with pkgs; [ maple-mono.NF ];
  };
}
