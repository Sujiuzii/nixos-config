{ ... }:

{
  imports = [
    ./display-manager
    ./window-manager
    ./desktop-manager
  ];

  services.xserver = {
    enable = true;
    # dpi = 144;
    xkb.layout = "us";
  };

  services.libinput.enable = true;
}
