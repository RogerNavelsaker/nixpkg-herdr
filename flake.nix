{
  description = "Pinned Nix re-export of Herdr";

  inputs.herdr.url = "github:herdrdev/herdr?rev=143bf5fd4781d164260c63fe28e7dc08054ad32f";

  outputs = { herdr, ... }:
    let
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
