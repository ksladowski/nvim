return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local nt = require("nvim-tree")
        nt.setup({
            hijack_cursor = true,
            sync_root_with_cwd = true,
            view = {
                width = 30,
            },
            update_focused_file = {
                enable = true,
            },
            diagnostics = {
                enable = true,
            },
            filters = {
                dotfiles = true,
                custom = { "^.git$" },
            },
            tab = {
                sync = {
                    open = true,
                    close = true,
                },
            },
        })
    end,
    keys = {
        { "<leader><tab>", "<cmd>NvimTreeFocus<cr>", desc = "Open File Explorer" },
    },
}
