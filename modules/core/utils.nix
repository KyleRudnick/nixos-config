{ pkgs, pkgs-unstable, ... }:
{
  programs = {
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  environment.systemPackages = with pkgs; [
    amfora
    bottom
    cachix
    cmatrix
    cowsay
    duf
    dysk
    eza
    ffmpeg
    file
    gping
    htop
    inxi
    killall
    lm_sensors
    lolcat
    lshw
    ncdu
    nixfmt
    onefetch
    opencode
    openssl
    pciutils
    pkg-config
    ripgrep
    socat
    sox
    unrar
    unzip
    usbutils
    vim
    wget
  ] ++ (with pkgs-unstable; [
    neovim
    zellij
  ]);
}
