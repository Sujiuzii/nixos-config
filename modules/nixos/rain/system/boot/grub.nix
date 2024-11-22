{ pkgs, config, lib, ... }:

let
  cfg = config.rain.system.boot.loader;
in with lib; {
  options = {
    rain.system.boot.loader = mkOption {
      type = types.enum ["grub2"];
      default = "grub2";
      description = "Choose bootloader to use";
    };
  };

  config = mkIf (cfg == "grub2") {
    boot.loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      splashImage = null;
      backgroundColor = "#1e1e2e";
      theme = pkgs.stdenv.mkDerivation {
        pname = "catppuccin-grub2";
        version = "v0.1";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "grub";
          rev = "main";
          hash = "sha256-bDw+W69jeSiE1VBdQqqaeZf7OqCN7q5XYJ5+94PILXE=";
        };
        installPhase = ''
          cp -r $src/src/catppuccin-mocha-grub-theme $out
        '';
      };
      extraEntries = ''
        menuentry "Reboot" {
          reboot
        }
        menuentry "Poweroff" {
          halt
        }
      '';
    };
  };
}
