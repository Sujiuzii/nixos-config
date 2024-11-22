{ lib, config, pkgs, ... }:

let
  cfg = config.rain.user;
in with lib; {
  options = {
    rain.user = {
      suhui.enable = mkEnableOption "user suhui";
    };
  };

  config = mkIf cfg.suhui.enable {
    users.defaultUserShell = pkgs.fish;

    users.users.suhui = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "audio" "adbusers" "docker" "openvpn" ]; 
    };
  };
}
