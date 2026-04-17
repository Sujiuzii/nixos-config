{ ... }:

{
  home = {
    username = "zjb";
    homeDirectory = "/home/zjb";
  };

  fluffy.home.software.cli.enable = true;

  systemd.user.startServices = "sd-switch";
  targets.genericLinux.enable = true;

  home.stateVersion = "23.11";
}
