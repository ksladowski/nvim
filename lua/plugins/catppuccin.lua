return {
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
}
