{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    mnw.url = "github:Gerg-L/mnw";
  };
  outputs =
    {
      nixpkgs,
      mnw,
      self,
      ...
    }:
    {
      packages.x86_64-linux =
        let
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in
        {
          default = mnw.lib.wrap pkgs {
            neovim = pkgs.neovim-unwrapped;

            luaFiles = [ ./init.lua ];

            plugins = {
              start = import ./nix/startPlugins.nix args;
              # Anything that you're loading lazily should be put here
              opt = import ./nix/optPlugins.nix args;

              dev.myconfig = {
                # you can use lib.fileset to reduce rebuilds here
                # https://noogle.dev/f/lib/fileset/toSource
                pure = ./.;
                impure = /home/kevin/src/nvim;
              };
            };
          };

          dev = self.packages.x86_64-linux.default.devMode;
        };
    };
}
