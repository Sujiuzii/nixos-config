{ lib, config, pkgs, ... }:

{
  config = lib.mkIf config.rain.home.software.desktop.enable {
    programs.vscode = {
      enable = true;

      # non-fhs package may cause some issue for debugging
      package = pkgs.vscode.fhs;

      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        ms-vscode.cpptools
        ms-vscode.cmake-tools
        ms-vscode-remote.remote-ssh

        github.copilot

        vscodevim.vim

        mhutchie.git-graph
        dracula-theme.theme-dracula
      ];
    };
  };
}
