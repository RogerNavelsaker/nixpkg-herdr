{
  description = "Pinned Nix re-export of Herdr";

  inputs.herdr.url = "github:herdrdev/herdr?rev=143bf5fd4781d164260c63fe28e7dc08054ad32f";

  outputs = { herdr, ... }: {
    packages = herdr.packages;
  };
}
