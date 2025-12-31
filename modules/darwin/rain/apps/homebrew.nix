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
      taps = [
        "caarlos0/tap"
        "felixkratz/formulae"
        # "homebrew/cask-fonts"
      ];
      brews = [
        "caarlos0/tap/timer" "cloudflared" "doctl" "fastfetch" "fd" "sketchybar" 
        "gemini-cli" "git" "glow" "go" "helm" "neovim" "redis" 
        "ripgrep" "yazi" "mihomo" "fish" "kubernetes-cli" 
        "fancy-cat" "btop" "zoxide" "eza" "fzf"
      ];
      casks = [
        "1password-cli" "claude-code" "font-sf-pro" "ghostty" "kitty"
        "obsidian" "raycast" "sf-symbols" "wezterm" "clash-verge-rev"
        "qq" "firefox" "bluestacks" "bilibili" "anki" "visual-studio-code"
        "wechat" "tailscale-app"
        "tencent-meeting" "steam" "neteasemusic" "typora"
      ];
    };
  };
}
