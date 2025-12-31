{ lib, config, ... }:

let
  cfg = config.rain.darwin.system;
in with lib; {
  options.rain.darwin.system = {
    enable = mkEnableOption "Enable basic system settings";
  };

  config = mkIf cfg.enable {
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
      trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ];
      trusted-users = [ "root" "suhui" ];
    };

    system.stateVersion = 5;
    nixpkgs.hostPlatform = "aarch64-darwin";
    
    system.primaryUser = "suhui";

    users.users.suhui = {
      name = "suhui";
      home = "/Users/suhui";
    };

    programs.zsh.enable = true;
  };
}
