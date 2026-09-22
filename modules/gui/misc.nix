{ pkgs, ... }:
{
  programs = {
    dconf.enable = true;
    seahorse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    brave
    brightnessctl
    eog
    file-roller
    gdu
    imagemagick
    libnotify
    mpv
    pavucontrol
    picard
    playerctl
    rhythmbox
    spotify
    v4l-utils
    waypaper
    ytmdl
  ];
}
