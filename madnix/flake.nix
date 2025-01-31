{
  description = "Madnix - my custom NixOs flavor.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
        inherit system;

        config = {
            allowUnfree = true;
        };
    };
  in
  {

      nixosConfigurations = {
          madnix-laptop = nixpkgs.lib.nixosSystem {
              specialArgs = { inherit system; };

              modules = [
              ./nixos/laptop/configuration.nix
              ];
          };
      };
  };
}
