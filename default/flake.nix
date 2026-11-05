{
  description = "NixOS configuration";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-26.05";
     disko.url =  "github:nix-community/disko";
     disko.inputs.nixpkgs.follows = "nixpkgs";
};
  outputs = { self, nixpkgs, ... }@inputs:
    let
      nixpkgs = inputs.unstable;
      system = "x86_64-linux";
      forAllSystems = nixpkgs.lib.genAttrs;
    in
    {
      formatter = forAllSystems (
        system: nixpkgs.legacyPackages.${system}.nixfmt-tree
      );
      nixosConfigurations.existere = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
  inputs.disko.nixosModules.disko
        ];
specialArgs = {
    inherit inputs;
  };
};
};
}