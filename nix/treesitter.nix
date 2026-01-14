{ pkgs }:
let
  my-treesitter = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: with p; [
                  bash
                  # c - included
                  c_sharp
                  comment
                  css
                  diff
                  dockerfile
                  editorconfig
                  html
                  ini
                  json
                  # lua - included
                  luadoc
                  # markdown - included
                  # markdown_inline - included
                  mermaid
                  nix
                  python
                  query
                  sql
                  # vim - included
                  # vimdoc - included
                  xml
                  yaml
  ]);
in
  [ my-treesitter ]

