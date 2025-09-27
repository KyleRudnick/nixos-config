{
  description = "Kyles Nix Config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix/release-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      host = "kyle";
      profile = "desktop";
      username = "kyle";
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        amd = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit host;
            inherit profile;
            inherit pkgs-unstable;
          };
          modules = [ ./profiles/amd ];
        };
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit host;
            inherit profile;
            inherit pkgs-unstable;
          };
          modules = [ ./profiles/desktop ];
        };
        nvidia-laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit host;
            inherit profile;
            inherit pkgs-unstable;
          };
          modules = [ ./profiles/nvidia-laptop ];
        };
        intel = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit host;
            inherit profile;
            inherit pkgs-unstable;
          };
          modules = [ ./profiles/intel ];
        };
        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit host;
            inherit profile;
            inherit pkgs-unstable;
          };
          modules = [ ./profiles/vm ];
        };
      };
    };
}
