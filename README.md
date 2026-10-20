# nixpkg-herdr

Thin, commit-pinned re-export of the Herdr flake package.

The input is pinned to `herdrdev/herdr` commit `143bf5fd4781d164260c63fe28e7dc08054ad32f`, which includes the POSIX-shell API-discovery fix for Nushell remotes.

Build with:

```sh
nix build .#default
```
