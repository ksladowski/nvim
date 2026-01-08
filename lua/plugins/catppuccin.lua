return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000, -- make sure it loads first
        config = function()
            require("catppuccin").setup({
                auto_integrations = true,
                highlight_overrides = {
                    all = {
                        LineNr = { fg = "#b5bfe2" }, -- brighter foreground for line numbers
                        CursorLineNr = { fg = "#eed49f", bold = true }, -- optional: brighter current line number
                    },
                },
                transparent_background = true,
                -- highlight_overrides = {
                --     all = function(colors)
                --         return {
                --             NormalFloat = { -- this is needed for which-key, maybe others
                --                 fg = colors.none,
                --                 bg = colors.none,
                --             },
                --         }
                --     end,
                -- },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
