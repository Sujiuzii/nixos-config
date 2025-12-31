{ lib, config, ... }:

let
  cfg = config.rain.darwin.services.aerospace;
in with lib; {
  options.rain.darwin.services.aerospace = {
    enable = mkEnableOption "Enable aerospace";
  };

  config = mkIf cfg.enable {
    services.aerospace = {
      enable = true;
      settings = {
        after-login-command = [];
        after-startup-command = [ "exec-and-forget sketchybar" ];

        exec-on-workspace-change = [
          "/bin/bash"
          "-c"
          "sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE"
        ];

        enable-normalization-flatten-containers = true;
        enable-normalization-opposite-orientation-for-nested-containers = true;

        accordion-padding = 30;
        default-root-container-layout = "accordion";
        default-root-container-orientation = "vertical";

        key-mapping.preset = "qwerty";
        on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

        gaps = {
          inner.horizontal = 18;
          inner.vertical = 18;
          outer.left = 18;
          outer.bottom = 18;
          outer.top = 18;
          outer.right = 18;
        };

        mode.main.binding = {
          "alt-slash" = "layout tiles horizontal vertical";
          "alt-comma" = "layout accordion vertical horizontal";

          "alt-h" = "focus left";
          "alt-j" = "focus down";
          "alt-k" = "focus up";
          "alt-l" = "focus right";

          "alt-shift-h" = "move left";
          "alt-shift-j" = "move down";
          "alt-shift-k" = "move up";
          "alt-shift-l" = "move right";

          "alt-1" = "workspace 1";
          "alt-2" = "workspace 2";
          "alt-3" = "workspace 3";
          "alt-4" = "workspace 4";
          "alt-5" = "workspace 5";
          "alt-i" = "workspace I";
          "alt-s" = "workspace S";
          "alt-b" = "workspace B";
          "alt-t" = "workspace T";
          "alt-v" = "workspace V";
          "alt-n" = "workspace N";
          "alt-m" = "workspace M";

          "alt-shift-1" = "move-node-to-workspace 1";
          "alt-shift-2" = "move-node-to-workspace 2";
          "alt-shift-3" = "move-node-to-workspace 3";
          "alt-shift-4" = "move-node-to-workspace 4";
          "alt-shift-5" = "move-node-to-workspace 5";
          "alt-shift-i" = "move-node-to-workspace I";
          "alt-shift-s" = "move-node-to-workspace S";
          "alt-shift-b" = "move-node-to-workspace B";
          "alt-shift-t" = "move-node-to-workspace T";
          "alt-shift-v" = "move-node-to-workspace V";
          "alt-shift-n" = "move-node-to-workspace N";
          "alt-shift-m" = "move-node-to-workspace M";

          "alt-shift-f" = "fullscreen";
          "alt-tab" = "workspace-back-and-forth";
          "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";
          "alt-shift-semicolon" = "mode service";
          "alt-shift-r" = "mode resize";
        };

        mode.resize.binding = {
          h = "resize width -50";
          j = "resize height +50";
          k = "resize height -50";
          l = "resize width +50";
          b = "balance-sizes";
          minus = "resize smart -50";
          equal = "resize smart +50";
          enter = "mode main";
          esc = "mode main";
        };

        mode.service.binding = {
          esc = [ "reload-config" "mode main" ];
          r = [ "flatten-workspace-tree" "mode main" ];
          f = [ "layout floating tiling" "mode main" ];
          backspace = [ "close-all-windows-but-current" "mode main" ];
          "alt-shift-h" = [ "join-with left" "mode main" ];
          "alt-shift-j" = [ "join-with down" "mode main" ];
          "alt-shift-k" = [ "join-with up" "mode main" ];
          "alt-shift-l" = [ "join-with right" "mode main" ];
        };

        on-window-detected = [
          { "if".app-id = "com.github.wez.wezterm"; run = "move-node-to-workspace T"; }
          { "if".app-id = "net.kovidgoyal.kitty"; run = "move-node-to-workspace T"; }
          { "if".app-id = "com.mitchellh.ghostty"; run = "move-node-to-workspace T"; }
          { "if".app-id = "com.apple.Music"; run = "move-node-to-workspace M"; }
          { "if".app-id = "com.google.Chrome"; run = "move-node-to-workspace B"; }
          { "if".app-id = "org.mozilla.firefox"; run = "move-node-to-workspace B"; }
          { "if".app-id = "company.thebrowser.Browser"; run = "move-node-to-workspace B"; }
          { "if".app-id = "com.microsoft.VSCode"; run = "move-node-to-workspace V"; }
          { "if".app-id = "com.todesktop.230313mzl4w4u92"; run = "move-node-to-workspace V"; }
          { "if".app-id = "com.google.android.studio"; run = "move-node-to-workspace I"; }
          { "if".app-id = "com.apple.dt.Xcode"; run = "move-node-to-workspace I"; }
          { "if".app-id = "com.tinyspeck.slackmacgap"; run = "move-node-to-workspace S"; }
          { "if".app-id = "com.apple.iphonesimulator"; run = "move-node-to-workspace T"; }
          { "if".app-id = "notion.id"; run = "move-node-to-workspace N"; }
          { "if".app-id = "com.tencent.qq"; run = "move-node-to-workspace D"; }
          { "if".app-id = "com.apple.finder"; run = "layout floating"; }
          { "if".app-id = "com.apple.ActivityMonitor"; run = "layout floating"; }
          { "if".app-id = "NULL-APP-BUNDLE-ID"; run = "move-node-to-workspace T"; }
        ];
      };
    };
  };
}
