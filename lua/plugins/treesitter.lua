return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        main = "nvim-treesitter.config",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "c_sharp",
                "comment",
                "css",
                "diff",
                "dockerfile",
                "editorconfig",
                "html",
                "ini",
                "json",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "mermaid",
                "nix",
                "python",
                "query",
                "sql",
                "vim",
                "vimdoc",
                "xml",
                "yaml",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        dependencies = "nvim-treesitter/nvim-treesitter",
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
            vim.g.no_plugin_maps = true
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        branch = "main",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
}
