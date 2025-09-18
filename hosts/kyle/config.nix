{
  options,
  config,
  lib,
  ...
}:
{
  options.builderSystem = {
    enable = lib.mkEnableOption "isBuilder";
  };
}
