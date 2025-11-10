{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    slack
    discord
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
