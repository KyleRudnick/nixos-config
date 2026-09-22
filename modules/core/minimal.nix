{ lib, ... }:
{
  options = {
    local.minimal = lib.mkEnableOption "Minimal system without home-manager and desktop packages";
    stylixImage = lib.mkOption {
      type = lib.types.path;
      description = "Path to the stylix wallpaper image";
    };
  };
}
