{
  inputs = {
    nixpkgs.url = github:NixOs/nixpkgs;
  };

  outputs = { self, nixpkgs }: {
    lib = import ./lib/default.nix { inherit nixpkgs; };
  };
}
