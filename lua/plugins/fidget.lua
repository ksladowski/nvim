return {
    "j-hui/fidget.nvim",
    opts = {
        notification = {
            override_vim_notify = true,
        },
    },
    keys = {
        { "<leader>N", "<cmd>Fidget history<cr>", desc = "[N]otifications" },
    },
}
