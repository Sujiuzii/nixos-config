{ ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  snowfallorg.users.suhui = { };

  rain.darwin = {
    system.enable = true;
    apps.homebrew.enable = true;
    apps.native.enable = true;
    services.aerospace.enable = false;
    fonts.enable = true;
  };
}
