{ lib }:

with builtins; with lib;

{ username
, sha256
}:

let
  keys_file = fetchurl {
    url = "https://github.com/${username}.keys";
    sha256 = sha256;
  };
in
filter (x: x != "") (splitString "\n" (readFile keys_file))
