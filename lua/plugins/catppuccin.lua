return {
        {'catppuccin/nvim', 
        lazy = false,
        priority = 1000, -- make sure it loads first
        config = function()
                require("catppuccin").setup({
                        transparent_background = true,
                        auto_integrations = true,
                })

                vim.cmd.colorscheme "catppuccin"
        end,
        }
}
