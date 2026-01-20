return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
            "mrbjarksen/neo-tree-diagnostics.nvim",
        },
        lazy = false, -- neo-tree will lazily load itself
        opts = {
            sources = {
                "filesystem",
                "git_status",
                "tests",
            },
            source_selector = {
                winbar = true,
                sources = {
                    { source = "filesystem" },
                    { source = "git_status" },
                    { source = "tests" },
                },
            },
            window = {
                width = 30,
                mappings = {
                    ["P"] = {
                        "toggle_preview",
                        config = {
                            use_float = true,
                            use_image_nvim = true,
                        },
                    },
                    ["h"] = function(state)
                        local node = state.tree:get_node()
                        if node.type == "directory" and node:is_expanded() then
                            require("neo-tree.sources.filesystem").toggle_directory(state, node)
                        else
                            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
                        end
                    end,
                    ["l"] = function(state)
                        local node = state.tree:get_node()
                        if node.type == "directory" then
                            if not node:is_expanded() then
                                require("neo-tree.sources.filesystem").toggle_directory(state, node)
                            elseif node:has_children() then
                                require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                            end
                        end
                    end,
                },
            },
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
                filtered_items = {
                    visible = false, -- hide filtered items on open
                    hide_gitignored = true,
                    hide_dotfiles = false,
                    hide_by_name = {
                        ".github",
                        ".gitignore",
                        "package-lock.json",
                        ".changeset",
                        ".prettierrc.json",
                    },
                    never_show = { ".git" },
                },
            },
        },
        keys = {
            { "<leader>	", "<cmd>Neotree<cr>", desc = "Neotree" },
            { "<leader>	f", "<cmd>Neotree<cr>", desc = "Neotree" },
            { "<leader>	g", "<cmd>Neotree git_status<cr>", desc = "Neotree" },
            { "<leader>	b", "<cmd>Neotree buffers<cr>", desc = "Neotree" },
            { "<leader>	d", "<cmd>Neotree diagnostics<cr>", desc = "Neotree" },
            { "<leader>	s", "<cmd>Neotree document_symbols<cr>", desc = "Neotree" },
            { "<leader>	t", "<cmd>Neotree tests<cr>", desc = "Neotree" },
        },
    },
}
