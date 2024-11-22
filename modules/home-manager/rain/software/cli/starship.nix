{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.rain.home.software.cli.enable {
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
  };
}
