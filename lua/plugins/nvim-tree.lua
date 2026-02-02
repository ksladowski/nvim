return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local nt = require("nvim-tree")
        local api = require("nvim-tree.api")
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
            on_attach = function(bufnr)
                local opts = { buffer = bufnr }
                api.config.mappings.default_on_attach(bufnr)
                -- function for left to assign to keybindings
                local lefty = function()
                    local node_at_cursor = api.tree.get_node_under_cursor()
                    -- if it's a node and it's open, close
                    if node_at_cursor.nodes and node_at_cursor.open then
                        api.node.open.edit()
                    -- else left jumps up to parent
                    else
                        api.node.navigate.parent()
                    end
                end
                -- function for right to assign to keybindings
                local righty = function()
                    local node_at_cursor = api.tree.get_node_under_cursor()
                    -- if it's a closed node, open it
                    if node_at_cursor.nodes and not node_at_cursor.open then
                        api.node.open.edit()
                    end
                end
                vim.keymap.set("n", "h", lefty, opts)
                vim.keymap.set("n", "l", righty, opts)
            end,
        })
    end,
    keys = {
        { "<leader><tab>", "<cmd>NvimTreeFocus<cr>", desc = "NvimTree" },
    },
}
