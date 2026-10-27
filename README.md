# nixpkg-herdr

Commit-pinned Herdr package with a small compatibility patch for Nushell SSH login shells.

The input is pinned to `herdrdev/herdr` commit `143bf5fd4781d164260c63fe28e7dc08054ad32f`, which includes the POSIX-shell API-discovery fix for Nushell remotes. The local patch runs POSIX probes through /bin/sh and avoids shell-specific redirection in the Windows probe.

Build with:

```sh
nix build .#default
```
