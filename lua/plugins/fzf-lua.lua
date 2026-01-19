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
        { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
        { "<leader>f", "<cmd>FzfLua files<cr>", desc = "Files" },
        { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
        { "<leader>/", "<cmd>FzfLua live_grep_native<cr>", desc = "Ripgrep" },
        { "<leader>hm", "<cmd>FzfLua manpages<cr>", desc = "Man Pages" },
        { "<leader>hn", "<cmd>FzfLua helptags<cr>", desc = "Neovim Help" },
        { "<leader>hk", "<cmd>FzfLua keymaps<cr>", desc = "Keybindings" },
    },
}
