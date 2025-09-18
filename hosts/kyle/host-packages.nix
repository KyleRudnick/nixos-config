{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cryptomator
    discord
    easyeffects
    gemini-cli
    ghostscript
    libreoffice-qt6-fresh
    slack
    typst
    websocat
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
