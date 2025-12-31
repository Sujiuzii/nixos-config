{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.shell.oh-my-posh;
in with lib; {
  options.rain.home.darwin.shell.oh-my-posh = {
    enable = mkEnableOption "Enable oh-my-posh";
  };

  config = mkIf cfg.enable {
    programs.oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      configFile = ../../../../../dotfiles/oh-my-posh/themes/powerlevel10k-custom.yaml;
    };
  };
}
