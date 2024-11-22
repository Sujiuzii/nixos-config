{ config, inputs, outputs, pkgs, ... }:

{
  imports = [
    ./cli
    ./desktop
  ];
}
