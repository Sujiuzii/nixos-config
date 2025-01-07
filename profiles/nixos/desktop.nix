{ lib, outputs, ... }:

{
  imports = [ 
    outputs.nixosModules.rain
  ];

  nix.settings = {
    substituters = lib.mkForce [ "https://mirrors.ustc.edu.cn/nix-channels/store" "https://cache.nixos.org" ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
      outputs.overlays.modifications
    ];
    config.allowUnfree = true;
  };

  rain = {
    xserver = {
      display-manager = "sddm";
      window-manager = "i3";
      desktop-manager = "xfce";
    };

    system = {
      sound.pipewire.enable = true;
      bluetooth.enable = true;
      fonts.enable = true;
      i18n.enable = true;
      boot.loader = "grub2";
      network = {
        enable = true;
        # proxy = {
        #   env.enable = true;
        #   nix.enable = true;
        # };
        openvpn.enable = true;
      };
    };

    software = {
      cli.enable = true;
      desktop = {
        applications.enable = true;
        games.enable = true;
        tools.enable = true;
      };
    };

    group.openvpn.enable = true;
    user.suhui.enable = true;
  };

  # For printing to PDF
  services.printing.enable = true;

  # Set the default i3-sensible-terminal
  environment.sessionVariables.TERMINAL = [ "kitty" ];

  environment.variables = {
    XCURSOR_THEME = "Sanae";
    XCURSOR_SIZE = "24";
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    INPUT_METHOD = "fcitx";
    GLFW_IM_MODULE = "ibus";
    TERM = "xterm-256color";
  };

  virtualisation.docker.enable = true;
}

