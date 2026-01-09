{ lib, outputs, ... }:

{
  imports = [
    outputs.darwinModules.rain
  ];

  rain.darwin = {
    system.enable = true;
    apps.homebrew.enable = true;
    services.aerospace.enable = true;
    fonts.enable = true;
  };

  # Home Manager configuration
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.suhui = {
    imports = [
      outputs.homeManagerModules.rain.darwin
    ];

    # Enable the home-manager modules
    rain.home.darwin = {
      shell.zsh.enable = true;
      shell.direnv.enable = true;
      shell.oh-my-posh.enable = true;
      term.kitty.enable = true;
      term.wezterm.enable = true;
      term.tmux.enable = true;
      apps.yazi.enable = true;
      apps.nvim.enable = true;
      services.sketchybar.enable = true;
    };

    home.stateVersion = "24.11"; # Added missing stateVersion
  };

  # Ensure user settings are applied correctly
  users.users.suhui.home = "/Users/suhui";
}
