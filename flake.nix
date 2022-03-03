{
  inputs = {
    flake-utils.url = github:numtide/flake-utils;
    nixpkgs.url = github:NixOs/nixpkgs;
  };

  outputs = { self, flake-utils, nixpkgs }:
    {
      lib = import ./lib/default.nix { inherit nixpkgs; };
    } // flake-utils.lib.eachDefaultSystem (system:
      let
        nixpkgs-pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = import ./pkgs/default.nix { pkgs = nixpkgs-pkgs; };
      }
    );
}
