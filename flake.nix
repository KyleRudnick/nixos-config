{
  description = "Kyles Nix Config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    zellij-nightly.url = "github:a-kenji/zellij-nix";
    zellij-nightly.inputs.nixpkgs.follows = "nixpkgs-unstable";
    stylix.url = "github:danth/stylix/release-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      zellij-nightly,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      cfg = import ./config.nix;
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

      hostsDir = ./hosts;
      hostNames = builtins.attrNames (builtins.readDir hostsDir);

      mkHost = hostname:
        let local = import (hostsDir + "/${hostname}/local.nix");
        in {
          name = hostname;
          value = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit inputs;
              inherit (local) hostname username profile gui;
              inherit (local) extraMonitorSettings intelID nvidiaID;
              inherit (cfg) gitUsername gitEmail browser terminal keyboardLayout consoleKeyMap clock24h thunarEnable waybarChoice;
              inherit pkgs-unstable;
              inherit zellij-nightly;
            };
            modules = [ (hostsDir + "/${hostname}") ];
          };
        };
    in
    {
      nixosConfigurations = builtins.listToAttrs (map mkHost hostNames);
    };
}
