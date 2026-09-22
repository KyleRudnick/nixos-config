{ thunarEnable, pkgs, ... }:
{
  programs = {
    thunar = {
      enable = thunarEnable;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer
  ];
}
