{ config, lib, ... }:

{
  imports = [
    ../../../hosts/lenovo/hardware-configuration.nix
  ];

  networking.hostName = "lenovo";

  nix.settings = {
    substituters = lib.mkForce [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
    experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config.allowUnfree = true;

  snowfallorg.users.suhui = { };

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

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        offload.enable = true;
        offload.enableOffloadCmd = true;
        intelBusId = "PCI:00:02:0";
        nvidiaBusId = "PCI:01:00:0";
      };
      open = false;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      nvidiaSettings = true;
    };
  };

  specialisation = {
    gaming-time.configuration = {
      hardware.nvidia = {
        prime.sync.enable = lib.mkForce true;
        prime.offload = {
          enable = lib.mkForce false;
          enableOffloadCmd = lib.mkForce false;
        };
      };
    };
  };

  services.printing.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  networking.networkmanager.enable = true;

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

  system.stateVersion = "22.05";
}
