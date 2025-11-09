{
  description = "Kyles Nix Config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    zellij-nightly.url = "github:a-kenji/zellij-nix";
    zellij-nightly.inputs.nixpkgs.follows = "nixpkgs-unstable";
    stylix.url = "github:danth/stylix/release-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
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
            inherit zellij-nightly;
            inherit inputs;
            inherit username;
            inherit host;
            inherit profile;
            inherit pkgs-unstable;
          };
          modules = [ ./profiles/desktop ];
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
