{ profile, ... }:
{
  imports = [
    ./hardware.nix
    ./drivers.nix
    ./packages.nix
    ../../profiles/${profile}
  ];
}
