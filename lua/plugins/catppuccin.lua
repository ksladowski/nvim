
-- transparency = {
        --         transparent_background = true,
        --         highlight_overrides = {
                --                 all = function(colors)
                        --                         return {
                                --                                 NormalFloat = { -- this is needed for which-key, maybe others
                                        --                                         fg = colors.none, 
                                        --                                         bg = colors.none 
                                        --                                 },
                                        --                         }
                                        --                 end,
                                        --         },
                                        -- }

                                        -- options = table.concat(configuration, ", ", transparency)

                                        return {
                                                {'catppuccin/nvim', 
                                                lazy = false,
                                                priority = 1000, -- make sure it loads first
                                                config = function()
                                                        require("catppuccin").setup({
                                                                auto_integrations = true,
                                                        })
                                                        vim.cmd.colorscheme "catppuccin"
                                                end,
                                        }
                                }
