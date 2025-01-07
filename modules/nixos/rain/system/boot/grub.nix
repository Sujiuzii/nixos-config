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
      efiInstallAsRemovable = true;
      theme = pkgs.stdenv.mkDerivation {
        pname = "catppuccin-grub2";
        version = "v0.1";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "grub";
          rev = "main";
          hash = "sha256-20D1EcV8SWOd5BLdAc6FaQu3onha0+aS5yA/GK8Ra0g=";
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
