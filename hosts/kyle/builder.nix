{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.drivers.nvidia;
in
{
  options.system.isbuilder = {
    enable = mkEnableOption "Enable Nvidia Drivers";
  };

  config = mkIf cfg.enable {
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  };
}
