{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.desktopManager.pantheon.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  environment.systemPackages = with pkgs; [
    pantheon.appcenter
  ];
}
