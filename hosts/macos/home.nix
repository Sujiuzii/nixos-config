{ config, pkgs, ... }:

{
  home.username = "suhui";
  home.homeDirectory = "/Users/suhui";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  xdg.configFile.aerospace.source = ../../dotfiles/aerospace;
  xdg.configFile.fonts.source = ../../dotfiles/fonts;
  xdg.configFile.ghostty.source = ../../dotfiles/ghostty;
  xdg.configFile.homebrew.source = ../../dotfiles/homebrew;
  xdg.configFile.kitty.source = ../../dotfiles/kitty;
  xdg.configFile.lazygit.source = ../../dotfiles/lazygit;
  xdg.configFile.nvim.source = ../../dotfiles/nvim;
  xdg.configFile."oh-my-posh".source = ../../dotfiles/oh-my-posh;
  xdg.configFile.sketchybar.source = ../../dotfiles/sketchybar;
  xdg.configFile.tmux.source = ../../dotfiles/tmux;
  xdg.configFile.wallpapers.source = ../../dotfiles/wallpapers;
  xdg.configFile.wezterm.source = ../../dotfiles/wezterm;
  xdg.configFile.yazi.source = ../../dotfiles/yazi;
  xdg.configFile.zshrc.source = ../../dotfiles/zshrc;

  home.file.".zshenv".text = ''
    export ZDOTDIR="$HOME/.config/zshrc"
  '';
}
