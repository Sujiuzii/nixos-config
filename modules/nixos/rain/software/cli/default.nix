{ lib, pkgs, config, ... }:

let
  cfg = config.rain.software.cli;
in with lib; {
  imports = [
    ./neovim
  ];

  options = {
    rain.software.cli.enable = lib.mkEnableOption "CLI tools";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      git
      htop
      iftop
      powertop
      acpi
      psmisc
      ranger
      yazi
      zip
      unzip
      tldr
      rsync
      patchelf
      docker-compose
      subversion
      tree
      light
      which
      file
      fzf
      ripgrep
      jq

      # Network Utilities
      dnsutils
      nettools
      netcat
      nmap
      wget
      iperf3
      termshark
      tcpdump

      clash-meta

      shell-gpt
    ];

    programs.fish.enable = true;
  };
}
