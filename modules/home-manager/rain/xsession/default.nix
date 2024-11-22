{ lib, ... }:

with lib; {
  imports = [
    # this part is edited needed, merge i3 configurations here
    ./window-manager
  ];
}
