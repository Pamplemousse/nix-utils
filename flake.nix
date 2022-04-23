{
  inputs = {
    flake-utils.url = github:numtide/flake-utils;
    nixpkgs.url = github:NixOs/nixpkgs;
  };

  outputs = { self, flake-utils, nixpkgs }:
    {
      lib = import ./lib/default.nix { inherit nixpkgs; };
      modules = import ./modules/default.nix;
    } // flake-utils.lib.eachDefaultSystem (system:
      let
        nixpkgs-pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = import ./pkgs/default.nix;
        devShell = nixpkgs-pkgs.mkShell {
          buildInputs = with nixpkgs-pkgs; [
            nixpkgs-fmt
          ];
        };
      }
    );
}
