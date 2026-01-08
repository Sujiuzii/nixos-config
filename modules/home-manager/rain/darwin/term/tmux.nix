{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.term.tmux;
in with lib; {
  options.rain.home.darwin.term.tmux = {
    enable = mkEnableOption "Enable tmux";
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      historyLimit = 100000;
      baseIndex = 1;
      mouse = true;
      escapeTime = 0;
      keyMode = "vi";
      shortcut = "a"; # 这对应你原来配置里的 Ctrl-a (Prefix)
      
      # 使用 Nix 管理插件，替代 TPM
      plugins = with pkgs.tmuxPlugins; [
        sensible
        vim-tmux-navigator
        yank
      ];

      # 将剩余的自定义配置放入 extraConfig
      extraConfig = ''
        # === General Settings ===
        set -ag terminal-overrides ",xterm-256color:RGB"
        set -g renumber-windows on
        set -g set-clipboard on
        
        # === Bindings ===
        # Window Management (Split in current path)
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"

        # Reload (注意: 在 Nix 中通常建议使用 rebuild switch，而不是内部 reload)
        unbind r
        bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"

        # Vi mode specific bindings
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

        # Resizing (Vim style)
        bind -r j resize-pane -D 5
        bind -r k resize-pane -U 5
        bind -r l resize-pane -R 5
        bind -r h resize-pane -L 5
        bind -r m resize-pane -Z

        # Clear history
        bind-key -n C-S-k send-keys -R \; clear-history

        # === Cyberdream Theme ===
        # Color definitions
        color_bg="#16181a"
        color_bg_alt="#1e2124"
        color_fg="#d3d7df"
        color_blue="#5ea1ff"
        color_grey="#7b8496"
        color_border="#3c4048"
        color_red="#ff6e5e"
        color_yellow="#f1ff5e"
        color_purple="#bd5eff"
        color_cyan="#5ef1ff"

        # Apply Status Style
        set -g status-style "bg=$color_bg,fg=$color_fg"
        set -g status-left-style "bg=$color_bg,fg=$color_blue"
        set -g status-right-style "bg=$color_bg,fg=$color_blue"

        # Window status colors
        set -g window-status-style "bg=$color_bg_alt,fg=$color_grey"
        set -g window-status-current-style "bg=$color_blue,fg=$color_bg,bold"
        set -g window-status-activity-style "bg=$color_red,fg=$color_bg"
        set -g window-status-bell-style "bg=$color_yellow,fg=$color_bg"

        # Pane border colors
        set -g pane-border-style "fg=$color_border"
        set -g pane-active-border-style "fg=$color_blue"

        # Message colors
        set -g message-style "bg=$color_blue,fg=$color_bg"
        set -g message-command-style "bg=$color_purple,fg=$color_bg"

        # Copy mode colors
        set -g mode-style "bg=$color_cyan,fg=$color_bg"

        # Status bar content
        set -g status-right-length 100
        set -g status-left-length 100
        set -g status-left ""
        
        # 显示 session 名字和 session 个数
        set -g status-right "#[fg=$color_fg,bg=$color_blue] #(tmux list-sessions | wc -l | tr -d ' ') #[fg=$color_fg,bg=$color_bg] #{session_name} "

        # Window status format
        set -g window-status-format "#[fg=$color_fg,bg=$color_bg] #{b:pane_current_path}#{?window_zoomed_flag, (),} #[fg=$color_bg,bg=$color_grey] #I "
        set -g window-status-current-format "#[fg=$color_fg,bg=$color_bg] #{b:pane_current_path}#{?window_zoomed_flag, (),} #[fg=$color_fg,bg=$color_blue] #I "

        # Make the status bar transparent (Must be at the end)
        set -g status-bg default
        set -g status-style bg=default
      '';
    };
  };
}
