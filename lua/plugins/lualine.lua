require("lualine").setup({
    options = {
        disabled_filetypes = {
            statusline = { "neo-tree" },
            winbar = {},
        },
        component_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = {
            {
                "filename",
            },
        },
        lualine_b = {
            {
                "b:gitsigns_head",
                icon = "",
            },
        },
        lualine_c = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
            },
        },
        lualine_x = {
            {
                function()
                    r = require("noice").api.statusline.mode.get()
                    if not r then
                        r = ""
                    end
                    return r:gsub("[Rr]ecording%s*@%s*", "")
                end,
                cond = require("noice").api.statusline.mode.has,
                icon = "",
                color = { fg = "#f38ba8" },
            },
            { "location" },
            { "progress" },
        },
        lualine_y = {
            { "filesize" },
            { "filetype" },
        },
        lualine_z = {
            { "o:encoding" },
            {
                "fileformat",
                icons_enabled = true,
            },
        },
    },
    inactive_sections = {
        lualine_a = {
            {
                "filename",
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
            { "filesize" },
            { "filetype" },
        },
        lualine_z = {
            { "o:encoding" },
            {
                "fileformat",
                icons_enabled = true,
            },
        },
    },
})
