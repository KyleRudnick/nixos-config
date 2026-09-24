{ inputs, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
    ../../modules/core
    ../../modules/wsl
  ];
}
