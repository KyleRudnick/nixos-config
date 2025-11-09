{ pkgs, zellij-nightly, ... }:
{
  environment.systemPackages = with pkgs; [
    zellij-nightly.packages.${pkgs.system}.default
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
