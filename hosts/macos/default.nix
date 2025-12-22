{ pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vim
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.suhui = {
    name = "suhui";
    home = "/Users/suhui";
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    taps = [
        "caarlos0/tap"
        "felixkratz/formulae"
        "jandedobbeleer/oh-my-posh"
    ];
    brews = [
        "timer"
        "cloudflared"
        "doctl"
        "eza"
        "fastfetch"
        "fd"
        "sketchybar"
        "fzf"
        "gemini-cli"
        "git"
        "glow"
        "go"
        "helm"
        "oh-my-posh"
        "lazygit"
        "neovim"
        "redis"
        "ripgrep"
        "stow"
        "tmux"
        "yazi"
        "zoxide"
    ];
    casks = [
        "1password-cli"
        "aerospace"
        "arc"
        "claude-code"
        "font-sf-pro"
        "ghostty"
        "kitty"
        "obsidian"
        "raycast"
        "sf-symbols"
        "wezterm"
    ];
  };
}
