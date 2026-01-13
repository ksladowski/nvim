{ pkgs, mnw }:
let
  args = { inherit pkgs; };
in
mnw.lib.wrap pkgs {
  neovim = pkgs.neovim.unwrapped;

  luaFiles = [ ./init.lua ];

  plugins = {
          startAttrs = import ./nix/startPlugins.nix args;
          # start = import ./nix/treesitter.nix args;
          optAttrs = import ./nix/optPlugins.nix args;
          dev.config = {
                  pure = builtins.toString ./.;
                  impure = "${builtins.getEnv "HOME"}/src/nvim";
          };
  };

  extraBinPath =
          import ./nix/lsp.nix args
          ++(import ./nix/format.nix args);
}
