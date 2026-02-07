return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
        "nvimtools/hydra.nvim",
    },
    config = function()
        local dap = require("dap")
        local ui = require("dapui")

        require("dapui").setup()
        require("nvim-dap-virtual-text").setup()

        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
        vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to Cursor" })

        vim.keymap.set("n", "<leader>dc", dap.continue)

        vim.keymap.set("n", "<leader>di", dap.step_into)
        vim.keymap.set("n", "<leader>ds", dap.step_over)
        vim.keymap.set("n", "<leader>do", dap.step_out)
        vim.keymap.set("n", "<leader>db", dap.step_back)
        vim.keymap.set("n", "<leader>dR", dap.restart)

        local clues = require("mini.clue").config.clues
        table.insert(clues, { mode = { "n", "x" }, keys = "<Leader>di", postkeys = "<Leader>d" })
        table.insert(clues, { mode = { "n", "x" }, keys = "<Leader>ds", postkeys = "<Leader>d" })
        table.insert(clues, { mode = { "n", "x" }, keys = "<Leader>do", postkeys = "<Leader>d" })
        table.insert(clues, { mode = { "n", "x" }, keys = "<Leader>db", postkeys = "<Leader>d" })

        dap.listeners.before.attach.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            ui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            ui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            ui.close()
        end
    end,
}
