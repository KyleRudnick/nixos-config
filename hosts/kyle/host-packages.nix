{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gemini-cli
    easyeffects
    websocat
    typst
    slack
    discord
    libreoffice-qt6-fresh
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
