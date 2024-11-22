{ lib, pkgs, config, ... }:

let
  cfg = config.rain.system.network;
in with lib; {
  options = {
    rain.system.network = {
      enable = mkEnableOption "system network";
      tailscale.enable = mkEnableOption "tailscale";
      proxy = {
        env.enable = mkEnableOption "proxy environment variables";
        nix.enable = mkEnableOption "nix proxy";
      };
      # clash.enable = mkEnableOption "clash";
      openvpn.enable = mkEnableOption "openvpn";
    };
  };

  config = mkIf cfg.enable {
    networking.enableIPv6 = true;
    networking.useDHCP = mkDefault true;
    networking.networkmanager.enable = true;

    services.resolved = {
      enable = true;
      dnssec = "false";
    };

    services.tailscale.enable = mkIf cfg.tailscale.enable true;
    networking.firewall.checkReversePath = mkIf cfg.tailscale.enable "loose";

    environment.sessionVariables = mkIf cfg.proxy.env.enable {
      http_proxy = [ "127.0.0.1:7890" ];
      https_proxy = [ "127.0.0.1:7890" ];
    };

    systemd.services.nix-daemon.environment = mkIf cfg.proxy.nix.enable {
      http_proxy = "127.0.0.1:7890";
      https_proxy = "127.0.0.1:7890";
    };

    # services.clash = mkIf cfg.clash.enable {
    #   enable = true;
    #   config = /home/suhui/.config/clash-service/config.yaml;
    # };

    services.openvpn = mkIf cfg.openvpn.enable {
      servers = {
        LABVPN = {
          autoStart = false;
          config = ''
            config /etc/openvpn/client.ovpn
          '';
        };
      };
    };

    systemd.services.openvpn-LABVPN = mkIf cfg.openvpn.enable {
      wantedBy = [ ];
      path = [ pkgs.openvpn ];
    };

  };
}
