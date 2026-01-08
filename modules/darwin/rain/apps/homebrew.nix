{ lib, config, ... }:

let
  cfg = config.rain.darwin.apps.homebrew;
in with lib; {
  options.rain.darwin.apps.homebrew = {
    enable = mkEnableOption "Enable homebrew";
  };

  config = mkIf cfg.enable {
    homebrew = {
      enable = true;
      onActivation = {
        cleanup = "zap";
        autoUpdate = true;
        upgrade = true;
      };
      caskArgs = {
        no_quarantine = true;
      };
      taps = [
        "caarlos0/tap"
        "felixkratz/formulae"
      ];
      brews = [
        "caarlos0/tap/timer" "fastfetch" "fd" "sketchybar" 
        "gemini-cli" "git" "glow" "neovim"
        "ripgrep" "yazi" "mihomo" "fish" 
        "btop" "zoxide" "eza" "fzf"
      ];
      casks = [
        "claude-code" "font-sf-pro" "ghostty" "kitty"
        "raycast" "sf-symbols" "wezterm" "clash-verge-rev"
        "qq" "firefox" "bluestacks" "bilibili" "anki" "visual-studio-code"
        "tencent-meeting" "steam" "neteasemusic" "typora" "foxit-pdf-editor"
        "wechat" "tailscale-app" "squirrel-app" "telegram-desktop"
        "TheBoredTeam/boring-notch/boring-notch"
      ];
    };
  };
}
