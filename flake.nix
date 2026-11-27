{
  description = "Pinned Nix re-export of Herdr";

  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://rogernavelsaker.cachix.org"
      "https://nacosolutions.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "rogernavelsaker.cachix.org-1:n1DtzMNhA9Rz4Kg3xlXOi/KceULu8VrMbs9WXyMFQNQ="
      "nacosolutions.cachix.org-1:JzCiW2CLcuLXtwOVAg3SlSK/kpqWbfSFEVenyKVUlug="
    ];
  };

  inputs.herdr.url = "github:herdrdev/herdr?rev=e8d7d9705a7a2c89cef4dd42079379f05685af87";

  outputs = { herdr, ... }:
    let
      pinnedRev = "e8d7d9705a7a2c89cef4dd42079379f05685af87";
      packages = builtins.mapAttrs (_system: systemPackages:
        let
          patched = systemPackages.default.overrideAttrs (old: {
            patches = (old.patches or [ ]) ++ [ ./patches/nushell-ssh-probes.patch ];
          });
        in
        systemPackages // {
          default = patched;
          herdr = patched;
        }
      ) herdr.packages;
    in
    { inherit packages; };
}
