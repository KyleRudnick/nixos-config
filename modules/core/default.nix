{ inputs, ... }:
{
  imports = [
    ./boot.nix
    ./caching.nix
    ./hardware.nix
    ./minimal.nix
    ./network.nix
    ./nfs.nix
    ./nh.nix
    ./security.nix
    ./services.nix
    ./sops.nix
    ./ssh.nix
    ./syncthing.nix
    ./system.nix
    ./user.nix
    ./utils.nix
    ../drivers
    inputs.stylix.nixosModules.stylix
  ];
}
