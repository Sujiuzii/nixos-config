{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.term.tmux;
in with lib; {
  options.rain.home.darwin.term.tmux = {
    enable = mkEnableOption "Enable tmux";
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      shell = "''${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      historyLimit = 100000;
      baseIndex = 1;
      mouse = true;
      escapeTime = 0;
      keyMode = "vi";
      shortcut = "a";
      plugins = with pkgs.tmuxPlugins; [
        sensible
        vim-tmux-navigator
        yank
      ];
      extraConfig = builtins.readFile ../../../../../dotfiles/tmux/tmux.conf;
    };
  };
}
