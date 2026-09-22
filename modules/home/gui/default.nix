{ gui, ... }:
{
  imports = [
    ./cava.nix
    ./emoji.nix
    ./fastfetch
    ./ghostty.nix
    ./gtk.nix
    ./kitty.nix
    ./qt.nix
    ./rofi
    ./stylix.nix
    ./swappy.nix
    ./virtmanager.nix
    ./vscode.nix
    ./wezterm.nix
    ./xdg.nix
  ] ++ (if gui == "hyprland" then [
    ./hyprland
  ] else if gui == "pantheon" then [
    ./pantheon
  ] else []);
}
