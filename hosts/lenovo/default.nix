{ config, pkgs, ... }:

{
  imports = [
    ../../profiles/nixos/desktop.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "lenovo";

  # Configure the NVIDIA graphic card.
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      # prime = {
      #   offload.enable = true;
      #   offload.enableOffloadCmd = true;
      #   intelBusId = "PCI:00:02:0";
      #   nvidiaBusId = "PCI:01:00:0";
      # };
      # open = true;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      nvidiaSettings = true;
    };
  };

  networking.networkmanager.enable = true;

  # services.xserver.videoDrivers = [ "modesetting" "nvidia" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05";
}
