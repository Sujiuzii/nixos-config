{ lib, config, ... }:

let
  cfg = config.fluffy.system.bluetooth;
in with lib; {
  options = {
    fluffy.system.bluetooth = {
      enable = mkEnableOption "system bluetooth";
    };
  };

  config = mkIf cfg.enable {
    # Set Bluetooth
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
  };
}
