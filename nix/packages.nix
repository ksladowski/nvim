{ pkgs }:

with pkgs; [
  ripgrep
  fzf
  fd
  tree-sitter
  # Really only need one of the following
  viu
  # ueberzugpp
  # chafa
]
