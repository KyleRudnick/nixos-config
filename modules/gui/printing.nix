{ lib, config, ... }:
with lib;
let cfg = config.local.printEnable; in
{
  options.local.printEnable = mkEnableOption "Printing (CUPS + Avahi)";

  config = mkIf cfg {
    services.printing.enable = true;
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    services.ipp-usb.enable = true;
  };
}
