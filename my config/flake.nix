{
  description = "NixOS configuration";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-26.05";
   # home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
     };
     disko.url = "github:nix-community/disko";
     disko.inputs.nixpkgs.follows = "nixpkgs";
     #noctalia = {
       url = "github:noctalia-dev/noctalia";
             inputs.nixpkgs.follows = "nixpkgs";
     };
     lazyvim.url = "github:pfassina/lazyvim-nix";

  };
  outputs = { self, nixpkgs, lazyvim, home-manager, ... }@inputs:
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
          inputs.home-manager.nixosModules.default
          ./configuration.nix
           inputs.disko.nixosModules.disko
           inputs.home-manager.nixosModules.home-manager
           home-manager.nixosModules.home-manager
  {
  home-manager.sharedModules = [
    lazyvim.homeManagerModules.default
  ];
}
        ];
specialArgs = {
    inherit inputs;
  };
};
};
}
