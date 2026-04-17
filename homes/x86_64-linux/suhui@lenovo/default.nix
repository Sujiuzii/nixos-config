{ ... }:

{
  home = {
    username = "suhui";
    homeDirectory = "/home/suhui";
  };

  fluffy.home = {
    software = {
      desktop.enable = true;
      cli.enable = true;
    };

    xsession.window-manager.i3 = {
      enable = true;
      applet = {
        app-menu = "rofi";
        bar = "polybar";
        compositor = "picom";
        screensaver = "i3lock-fancy";
      };
    };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
}
