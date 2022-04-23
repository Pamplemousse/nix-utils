{
  services = {
    web-apps = {
      cryptpad = import ./services/web-apps/cryptpad.nix;
    };
  };
}
