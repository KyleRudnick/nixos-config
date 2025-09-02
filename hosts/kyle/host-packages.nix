{ pkgs, pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    # noisetorch
    slack
    discord
    libreoffice-qt6-fresh
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
