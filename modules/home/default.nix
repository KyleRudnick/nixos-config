{ host, ... }:
let
  inherit (import ../../hosts/${host}/variables.nix) waybarChoice;
in
{
  imports = [
    ./evil-helix.nix
    ./tmux.nix
    ./amfora.nix
    ./bash.nix
    ./bashrc-personal.nix
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./devenv.nix
    ./emoji.nix
    ./eza.nix
    ./fastfetch
    ./fzf.nix
    ./gh.nix
    ./ghostty.nix
    ./git.nix
    ./gpg.nix
    ./gtk.nix
    ./htop.nix
    ./hyprland
    ./kitty.nix
    ./lazygit.nix
    #    ./nvf.nix
    # ./rio
    ./rofi
    ./neovim.nix
    ./qt.nix
    ./scripts
    ./starship.nix
    ./stylix.nix
    ./swappy.nix
    ./swaync.nix
    ./virtmanager.nix
    ./vscode.nix
    waybarChoice
    ./wezterm.nix
    ./wlogout
    ./xdg.nix
    ./yazi
    ./zellij
    ./zoxide.nix
    ./zsh
  ];
}
