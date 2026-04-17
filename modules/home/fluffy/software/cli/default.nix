{ lib, pkgs, config, ... }:

let
  cfg = config.fluffy.home.software.cli;
in with lib; {
  imports = [
    ./neovim.nix
    ./direnv.nix
    ./fish.nix
    ./git.nix
    ./gnupg.nix
    ./tmux.nix
    ./home-manager.nix
    ./starship.nix
  ];

  options = {
    fluffy.home.software.cli = {
      enable = mkEnableOption "home-manager CLI software";
    };
  };

  # add home host cli tools here
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      htop
      neofetch
      ranger
      appimage-run
      ncdu
      unar
    ];
  };
}
