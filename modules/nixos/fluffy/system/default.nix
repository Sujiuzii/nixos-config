{ lib, ... }:

with lib; {
  imports = [ 
    ./bluetooth.nix
    ./fonts.nix
    ./i18n.nix
    ./network.nix
  ];
}
