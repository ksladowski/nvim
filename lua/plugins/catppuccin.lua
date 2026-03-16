return {
    {
        "catppuccin/nvim",
        name = "catppuccin", -- shows up as just "nvim" by default
        lazy = false,
        priority = 1000, -- make sure it loads first
        config = function()
            require("catppuccin").setup({
                auto_integrations = true,
                highlight_overrides = {
                    all = function(colors)
                        return {
                            -- I find the line numbers don't have enough contrast
                            LineNr = { fg = colors.surface2 },
                            CursorLineNr = { fg = colors.lavender, bold = true },
                            FlashLabel = { fg = colors.crust, bg = colors.red },
                        }
                    end,
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     priority = 1000,
    --     config = function()
    --         require("gruvbox").setup({
    --             terminal_colors = true, -- add neovim terminal colors
    --             undercurl = true,
    --             underline = true,
    --             bold = true,
    --             italic = {
    --                 strings = true,
    --                 emphasis = true,
    --                 comments = true,
    --                 operators = false,
    --                 folds = true,
    --             },
    --             strikethrough = true,
    --             invert_selection = false,
    --             invert_signs = false,
    --             invert_tabline = false,
    --             inverse = true, -- invert background for search, diffs, statuslines and errors
    --             contrast = "", -- can be "hard", "soft" or empty string
    --             palette_overrides = {},
    --             overrides = {},
    --             dim_inactive = false,
    --             transparent_mode = false,
    --         })
    --         vim.cmd("colorscheme gruvbox")
    --     end,
    -- },
}
