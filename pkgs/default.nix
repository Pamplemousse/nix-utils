{ pkgs }:

with pkgs;

{
  security-wordlists = callPackage ./tools/security/wordlists/default.nix { };
}
