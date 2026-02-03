return {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua", "mfussenegger/nvim-dap" },
    lazy = true,
    cmd = "Dotnet",
    ft = { "razor", "cs", "csproj", "sln", "slnx" },
    config = function()
        local dotnet = require("easy-dotnet")
        dotnet.setup({
            debugger = {
                bin_path = nil,
                apply_value_converters = true,
                auto_register_dap = true,
                mappings = {
                    open_variable_viewer = { lhs = "T", desc = "open variable viewer" },
                },
            },
            ---@type TestRunnerOptions
            test_runner = {
                ---@type "split" | "vsplit" | "float" | "buf"
                viewmode = "float",
                ---@type number|nil
                vsplit_width = nil,
                ---@type string|nil "topleft" | "topright"
                vsplit_pos = nil,
                enable_buffer_test_execution = true, --Experimental, run tests directly from buffer
                noBuild = true,
                icons = {
                    passed = "",
                    skipped = "",
                    failed = "",
                    success = "",
                    reload = "",
                    test = "",
                    sln = "󰘐",
                    project = "󰘐",
                    dir = "",
                    package = "",
                },
                mappings = {
                    run_test_from_buffer = { lhs = "<leader>r", desc = "run test from buffer" },
                    run_all_tests_from_buffer = { lhs = "<leader>t", desc = "run all tests from buffer" },
                    peek_stack_trace_from_buffer = { lhs = "<leader>p", desc = "peek stack trace from buffer" },
                    filter_failed_tests = { lhs = "<leader>fe", desc = "filter failed tests" },
                    debug_test = { lhs = "<leader>d", desc = "debug test" },
                    go_to_file = { lhs = "g", desc = "go to file" },
                    run_all = { lhs = "<leader>R", desc = "run all tests" },
                    run = { lhs = "<leader>r", desc = "run test" },
                    peek_stacktrace = { lhs = "<leader>p", desc = "peek stacktrace of failed test" },
                    expand = { lhs = "o", desc = "expand" },
                    expand_node = { lhs = "E", desc = "expand node" },
                    expand_all = { lhs = "-", desc = "expand all" },
                    collapse_all = { lhs = "W", desc = "collapse all" },
                    close = { lhs = "q", desc = "close testrunner" },
                    refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" },
                },
                additional_args = {},
            },
            auto_bootstrap_namespace = {
                type = "file_scoped",
                enabled = true,
                use_clipboard_json = {
                    behavior = "prompt",
                    register = "+",
                },
            },
            picker = "fzf",
        })

        vim.keymap.set("n", "<leader>Dn", "<cmd>Dotnet add package<cr>", { desc = "[D]otnet [n]uget" })
        vim.keymap.set("n", "<leader>Db", "<cmd>Dotnet build<cr>", { desc = "[D]otnet [b]uild" })
        vim.keymap.set("n", "<leader>DB", "<cmd>Dotnet build solution<cr>", { desc = "[D]otnet [B]uild solution" })
    end,
}
