{ config, pkgs, lib, ... }:

let
  cfg = config.rain.home.darwin.shell.oh-my-posh;
in with lib; {
  options.rain.home.darwin.shell.oh-my-posh = {
    enable = mkEnableOption "Enable oh-my-posh";
  };

  config = mkIf cfg.enable {
    programs.oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      
      settings = {
        version = 3;
        final_space = true;
        console_title_template = "{{ .Shell }} in {{ .Folder }}";
        
        secondary_prompt = {
          template = "❯❯ ";
          foreground = "#bd5eff";
          background = "transparent";
        };

        transient_prompt = {
          template = "❯ ";
          background = "transparent";
          foreground_templates = [
            "{{if gt .Code 0}}#d9534f{{end}}"
            "{{if eq .Code 0}}#bd5eff{{end}}"
          ];
        };

        blocks = [
          {
            type = "prompt";
            alignment = "left";
            newline = true;
            segments = [
              {
                type = "path";
                style = "plain";
                template = "{{ .Path }}";
                foreground = "#5ea1ff";
                background = "transparent";
                properties = {
                  cache_duration = "none";
                  style = "folder";
                };
              }
              {
                type = "git";
                style = "plain";
                template = " {{ .HEAD }} ";
                foreground = "#ffffff";
                background = "transparent";
                properties = {
                  branch_icon = "";
                  cache_duration = "none";
                  fetch_stash_count = false;
                  fetch_status = false;
                  fetch_upstream_icon = false;
                  status_colors = false;
                };
              }
            ];
          }
          {
            type = "prompt";
            alignment = "left";
            newline = true;
            segments = [
              {
                type = "text";
                style = "plain";
                template = "❯";
                background = "transparent";
                foreground_templates = [
                  "{{if gt .Code 0}}#d9534f{{end}}"
                  "{{if eq .Code 0}}#bd5eff{{end}}"
                ];
                properties = {
                  cache_duration = "none";
                };
              }
            ];
          }
        ];
      };
    };
  };
}
