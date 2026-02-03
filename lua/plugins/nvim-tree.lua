return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "GustavEikaas/easy-dotnet.nvim",
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
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                api.config.mappings.default_on_attach(bufnr)

                vim.keymap.set("n", "h", function()
                    local node_at_cursor = api.tree.get_node_under_cursor()
                    if node_at_cursor.nodes and node_at_cursor.open then
                        api.node.open.edit()
                    else
                        api.node.navigate.parent()
                    end
                end, opts("Close or go to parent"))

                vim.keymap.set("n", "l", function()
                    local node_at_cursor = api.tree.get_node_under_cursor()
                    if node_at_cursor.nodes and not node_at_cursor.open then
                        api.node.open.edit()
                    end
                end, opts("Expand directory"))

                vim.keymap.set("n", "A", function()
                    local node = api.tree.get_node_under_cursor()
                    local path = node.type == "directory" and node.absolute_path or vim.fs.dirname(node.absolute_path)
                    require("easy-dotnet").create_new_item(path)
                end, opts("Create file from dotnet template"))
            end,
        })
    end,
    keys = {
        { "<leader><tab>", "<cmd>NvimTreeFocus<cr>", desc = "NvimTree" },
    },
}
