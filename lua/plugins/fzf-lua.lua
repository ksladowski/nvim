return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    opts = {
        "telescope",
    },
    ---@diagnostic enable: missing-fields
    keys = {
        { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "[:] Command History" },
        { "<leader>f", "<cmd>FzfLua files<cr>", desc = "Find [f]iles" },
        { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Find [b]uffers" },
        { "<leader>s", "<cmd>FzfLua live_grep_native<cr>", desc = "[s]earch cwd with rg" },
        { "<leader>/", "<cmd>FzfLua grep_curbuf<cr>", desc = "[/] Grep Current Buffer" },
        { "<leader>hm", "<cmd>FzfLua manpages<cr>", desc = "Help [m]an Pages" },
        { "<leader>hn", "<cmd>FzfLua helptags<cr>", desc = "Help [n]eovim" },
        { "<leader>hk", "<cmd>FzfLua keymaps<cr>", desc = "Help [k]eybindings" },
    },
}
