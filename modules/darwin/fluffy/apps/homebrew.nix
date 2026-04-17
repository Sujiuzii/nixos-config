{ lib, config, ... }:

let
  cfg = config.fluffy.darwin.apps.homebrew;
in with lib; {
  options.fluffy.darwin.apps.homebrew = {
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
      ];
      brews = [
        "caarlos0/tap/timer" "fastfetch" "fd"
        "gemini-cli" "git" "glow" "neovim" "lima"
        "ripgrep" "yazi" "mihomo" "fish" "subversion"
        "btop" "zoxide" "eza" "fzf" "lume" "docker"
        "jenkins" "kubernetes-cli" "wireshark"
        "python@3.10"
      ];
      casks = [
        "claude-code" "font-sf-pro" "ghostty" "kitty" "sioyek"
        "raycast" "sf-symbols" "wezterm" "clash-verge-rev"
        "qq" "firefox" "bluestacks" "bilibili" "anki" "visual-studio-code"
        "tencent-meeting" "steam" "neteasemusic" "typora" 
        "wechat" "tailscale-app" "squirrel-app" "telegram-desktop"
        "TheBoredTeam/boring-notch/boring-notch" "caffeine" "notion"
        "notion-calendar" "codex" "orbstack" "zotero" "slack"
        "finetune" "codex-app" "ungoogled-chromium" "ungoogled-chromium"
        "wireshark-app"
      ];
    };
  };
}
