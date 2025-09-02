{ pkgs-unstable, ... }:
{
  home.packages = [
    pkgs-unstable.devenv
    pkgs-unstable.direnv
  ];
}
