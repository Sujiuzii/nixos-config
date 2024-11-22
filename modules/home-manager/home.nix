{ inputs, outputs, config, pkgs, ...}:

{
  imports = [
    ./software
  ];
  
  home.username = "suhui";
  home.homeDirectory = "/home/suhui";

  home.packages = with pkgs; [
    firefox
    thunderbird
    slack
    chromium
    alacritty
    opam

    xfce.thunar

    # terminal tools for system check
    neofetch

    # archives
    zip
    unzip
    xz

    # utils
    ripgrep
    eza
    fzf

    # misc
    file
    which
    tree
    gnupg
    light

    # nix related
    nix-output-monitor

    # productivity
    glow

    btop
    htop
    iftop
    iotop

    # monitors
    strace
    ltrace
    lsof

    # sysrem tools
    sysstat
    ethtool
    usbutils    

    # proxy
    clash-meta
    clash-geoip
    clash-nyanpasu

    # others
    nitrogen
    dunst
    kitty
    grim
    mpv
    power-profiles-daemon
    libsForQt5.polkit-kde-agent
    spotify

    # work
    qq
    yazi
    zathura
    wireshark
    termshark
    tcpdump
    sxiv
    obs-studio
    okular
    subversion
    # wechat-uos

    (rizin.withPlugins (ps: with ps; [
      rz-ghidra
      sigdb
    ]))
    appimage-run

    remmina
    anki
    ghidra
    peek

    typora
    klog-time-tracker

    discord
    osu-lazer

    postman
    burpsuite

    outputs.packages.wemeetapp
  ];

  programs.git = {
    enable = true;
    userName = "Hui Su";
    userEmail = "daisyhuisu@gmail.com";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
      shell = {
        disabled = false;
        format = "$indicator";
        fish_indicator = "";
        bash_indicator = "[BASH](bright-white) ";
        zsh_indicator = "[ZSH](bright-white) ";
      };
      username = {
        style_user = "bright-white bold";
        style_root = "bright-red bold";
      };
      hostname = {
        style = "bright-green bold";
        ssh_only = true;
      };
      nix_shell = {
        symbol = "";
        format = "[$symbol$name]($style) ";
        style = "bright-purple bold";
      };
      git_branch = {
        only_attached = true;
        format = "[$symbol$branch]($style) ";
        style = "bright-yellow bold";
      };
      git_commit = {
        only_detached = true;
        format = "[$hash]($style) ";
        style = "bright-yellow bold";
      };
      git_state = {
        style = "bright-purple bold";
      };
      git_status = {
        style = "bright-green bold";
      };
      directory = {
        truncation_length = 0;
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "bright-blue";
      };
      jobs = {
        style = "bright-green bold";
      };
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
      # bashrcExtra = ''
      #   alias hello_world="echo hello_world"
      # ''

    shellAliases = {
      cowyes = "echo 'YES!!!' | cowsay";
    };
  };
 
  programs.fish = {
    enable = true;
    shellInit = ''
      # Load the OPAM environment variables
      eval (opam env)
      # Load the direnv environment variables
      eval (direnv hook fish)
      # set the $TERM
      set -x TERM xterm-256color
    '';
  };

  xdg.desktopEntries.wemeet = {
    name = "Wemeet";
    exec = "wemeetapp";
    icon = /etc/nixos/pkgs/wemeetapp/wemeet-icon.jpg;
    categories = [ "Application" ];
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
