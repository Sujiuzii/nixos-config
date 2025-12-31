{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.shell.zsh;
in with lib; {
  options.rain.home.darwin.shell.zsh = {
    enable = mkEnableOption "Enable zsh";
  };

  config = mkIf cfg.enable {
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
          "git" "aws" "kubectl" "kubectx" "command-not-found" 
        ];
      };

          shellAliases = {
            ".." = "cd ..";
            "..." = "cd ../..";
            "n" = "nvim";
            "lg" = "lazygit";
            "ltree" = "eza --tree --level=2 --long --icons";
            "clear" = "clear && tmux clear-history 2>/dev/null || clear";
          };
      
          history = {
            size = 5000;
            save = 5000;
            path = "''${ZDOTDIR:-$HOME}/.zsh_history";
            ignoreDups = true;
            share = true;
            ignoreSpace = true;
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
      
          sessionVariables = {
            EDITOR = "nvim";
            GPG_TTY = "$(tty)";
          };
      
          initContent = ''
            # === Vi Mode Config ===
            ZVM_VI_ESCAPE_BINDKEY=jj
            ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
            ZVM_VI_VISUAL_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
            ZVM_VI_OPPEND_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
            zvm_after_init_commands+=('source ${pkgs.fzf}/share/fzf/key-bindings.zsh')
      
            # === Styles ===
            zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
            zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
            zstyle ':completion:*' menu no
            zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
            zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
      
            # === Pomodoro ===
            function work () {
              timer 25m
              osascript -e 'display notification "Pomodoro" with title "Work Timer is up! Take a Break 😊" sound name "Crystal"'
            }
            function rest () {
              timer 5m
              osascript -e 'display notification "Pomodoro" with title "Break is over! Get back to work 😬" sound name "Crystal"'
            }
          '';    };
  };
}
