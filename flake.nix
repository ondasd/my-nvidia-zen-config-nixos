{
  description = "NixOS configuration";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-26.05";
  };
  outputs = { self, nixpkgs, ... }@inputs:
    let
      nixpkgs = inputs.unstable;
      system = "x86_64-linux";
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      formatter = forAllSystems (
        system: nixpkgs.legacyPackages.${system}.nixfmt-tree
      );

      nixosConfigurations.existere = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
        specialArgs = {
          inherit inputs self;
        };
      };
    };
}
