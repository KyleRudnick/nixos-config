{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.system.isbuilder;
in
{
  options.system.isbuilder = {
    enable = mkEnableOption "Enable remote builder via binfmt (aarch64 emulation)";
  };

  config = mkIf cfg.enable {
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  };
}
