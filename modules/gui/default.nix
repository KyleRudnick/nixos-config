{ gui, ... }:
{
  imports = [
    ./firefox.nix
    ./flatpak.nix
    ./fonts.nix
    ./gaming.nix
    ./misc.nix
    ./printing.nix
    ./starfish.nix
    ./thunar.nix
    ./virtualisation.nix
    ./xserver.nix
  ] ++ (if gui == "hyprland" then [
    ./hyprland
  ] else if gui == "pantheon" then [
    ./pantheon
  ] else []);
}
