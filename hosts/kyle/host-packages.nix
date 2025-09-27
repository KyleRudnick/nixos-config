{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cryptomator
    discord
    easyeffects
    aider-chat
    ghostscript
    libreoffice-qt6-fresh
    slack
    sshfs
    typst
    websocat
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
