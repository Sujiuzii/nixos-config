{ ... }:

{
  home = {
    username = "suhui";
    homeDirectory = "/Users/suhui";
  };

  rain.home.darwin = {
    shell.zsh.enable = true;
    shell.direnv.enable = true;
    shell.oh-my-posh.enable = true;
    term.kitty.enable = true;
    term.wezterm.enable = true;
    term.tmux.enable = true;
    apps.yazi.enable = true;
    apps.nvim.enable = true;
    services.sketchybar.enable = false;
  };

  home.stateVersion = "24.11";
}
