{ pkgs, ... }:
{
  programs = {
    hyprland.enable = true;
    hyprlock.enable = true;
  };

  environment.systemPackages = with pkgs; [
    tuigreet
    hyprpicker
  ];
}
