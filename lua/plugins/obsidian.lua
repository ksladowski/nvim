return {
    "obsidian-nvim/obsidian.nvim",
    ft = "markdown",
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false, -- will be removed in 4.0
        workspaces = {
            {
                name = "notes",
                path = "~/Documents/notes",
            },
        },
    },
    keys = {
        {
            "<leader>O",
            "<cmd>Obsidian<cr>",
            mode = "n",
            desc = "[O]bsidian",
        },
    },
}
