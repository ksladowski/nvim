return {
    "j-hui/fidget.nvim",
    config = function()
        require("fidget").setup({
            notification = {
                override_vim_notify = true,
            },
        })
        vim.keymap.set("n", "<leader>N", "<cmd>Fidget history<cr>", { desc = "[N]otifications" })
    end,
}
