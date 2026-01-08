{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.shell.zsh;
in with lib; {
  options.rain.home.darwin.shell.zsh = {
    enable = mkEnableOption "Enable zsh";
  };

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
      git = true;
    };

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      
      syntaxHighlighting = {
        enable = true;
        styles = {
          command = "fg=white";
          alias = "fg=white";
          builtin = "fg=white";
          precommand = "fg=white";
          default = "fg=white";
          function = "fg=white";
        };
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ 
          "git" 
          "command-not-found" 
        ];
      };

      history = {
        size = 5000;
        save = 5000;
        ignoreDups = true;
        share = true;
        ignoreSpace = true;
        ignoreAllDups = true;
      };

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        
        "n" = "nvim";
        "lg" = "lazygit";
        
        "l" = "eza -l --icons --git";
        "lt" = "eza --tree --level=2 --icons";
        "ltree" = "eza --tree --level=2 --long --icons";
        
        # System Maintenance
        "nd-rebuild" = "sudo -H HTTP_PROXY=http://127.0.0.1:7897 HTTPS_PROXY=https://127.0.0.1:7897 darwin-rebuild switch --flake /User/suhui/.config/nixos-config#macos --verbose";
        "nd-edit" = "yazi /Users/suhui/.config/nixos-config#macos";
      };

      sessionVariables = {
        EDITOR = "nvim";
        GPG_TTY = "$(tty)";
      };

      plugins = [
        {
          name = "zsh-vi-mode";
          src = pkgs.zsh-vi-mode;
        }
        {
          name = "fzf-tab";
          src = pkgs.zsh-fzf-tab;
        }
      ];

      initContent = ''
        # === Homebrew Setup (MacOS) ===
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
          eval "$(/opt/homebrew/bin/brew shellenv)"
        fi

        # === Custom Functions ===
        # Clear with Tmux support
        clear() { 
          command clear
          if [ -n "$TMUX" ]; then
            tmux clear-history 2>/dev/null || true
          fi
        }

        # === Vi Mode Configuration ===
        ZVM_VI_ESCAPE_BINDKEY=jj
        ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
        ZVM_VI_VISUAL_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
        ZVM_VI_OPPEND_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
        
        # Ensure FZF keybindings work with vi-mode
        zvm_after_init_commands+=('source ${pkgs.fzf}/share/fzf/key-bindings.zsh')

        # === Completion Styles (fzf-tab & regular) ===
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
        zstyle ':completion:*' menu no
        
        # FZF Preview for cd and zoxide
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
        zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'
      '';
    };
  };
}
