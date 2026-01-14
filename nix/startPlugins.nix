{ pkgs }:
{
  inherit (pkgs.vimPlugins)
    catppuccin-nvim
    conform-nvim
    fidget-nvim
    fzf-lua
    gitsigns-nvim
    lualine-nvim
    lz-n
    neo-tree-nvim
    nui-nvim # dependency for others
    nvim-lspconfig
    nvim-surround
    nvim-treesitter
    nvim-treesitter-context
    nvim-web-devicons
    plenary-nvim
    rainbow-delimiters-nvim
    # tiny-inline-diagnostic-nvim # Better `virtual_lines` from nvim 0.11
    which-key-nvim
    # blink-cmp
    # nvim-autopairs
    # oil-nvim
    # colorful-menu-nvim # Show completion types in color
    # cutlass-nvim
    # fugitive
    # luasnip
    # nvim-highlight-colors # Highlight hex codes
    # snacks-nvim
    # ts-comments-nvim # Lets me have multiple comment strings for `gcc` action
    # vim-rhubarb # Make `:GBrowse` from fugitive work with Github
    # mini-nvim stuff
    # mini-ai
    # mini-comment
    # mini-extra # More textobjects for mini-ai
    # mini-indentscope
    # helpview-nvim
    # markdown-preview-nvim
    # nvim-jdtls
    # typst-preview-nvim
    ;
}
