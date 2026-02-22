return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = { "lewis6991/gitsigns.nvim", "nvim-mini/mini.clue" },
    ---@type snacks.Config
    opts = {
        image = { enabled = true },
        picker = {
            enabled = true,
            win = {
                input = {
                    keys = {
                        ["<Esc>"] = { "close", mode = { "n", "i" } },
                    },
                },
            },
        },
        explorer = { enabled = true },
        indent = { enabled = true },
        dim = { enabled = true },
        keymap = { enabled = true },
        input = { enabled = true },
        toggle = { enabled = true },
        debug = { enabled = true },
        scope = { enabled = true },
        statuscolumn = { enabled = true },
        notify = { enabled = true },
        notifier = { enabled = true },
        gh = { enabled = true },
    },
    keys = {
        {
            "<leader><space>",
            function()
                Snacks.picker.smart()
            end,
            desc = "smart find file",
        },
        {
            "<leader>,",
            function()
                Snacks.picker.buffers()
            end,
            desc = "buffers",
        },
        {
            "<leader>:",
            function()
                Snacks.picker.command_history()
            end,
            desc = "command history",
        },
        {
            "<leader>n",
            function()
                Snacks.notifier.hide()
            end,
            desc = "dismiss all [n]otifications",
        },
        {
            "<leader>N",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "[N]otification history",
        },
        {
            "<leader>e",
            function()
                Snacks.explorer()
            end,
            desc = "[e]xplorer",
        },
        {
            "<leader>T",
            function()
                Snacks.picker.tags()
            end,
            desc = "[T]ags",
        },
        {
            "<leader>fc",
            function()
                Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
            end,
            desc = "[c]onfig",
        },
        {
            "<leader>ff",
            function()
                Snacks.picker.files()
            end,
            desc = "[f]ind",
        },
        {
            "<leader>p",
            function()
                Snacks.picker.projects()
            end,
            desc = "[p]rojects",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "[r]ecent",
        },
        -- git
        {
            "<leader>gb",
            function()
                Snacks.picker.git_branches()
            end,
            desc = "[b]ranches",
        },
        {
            "<leader>gl",
            function()
                Snacks.picker.git_log()
            end,
            desc = "[l]og",
        },
        {
            "<leader>gs",
            function()
                Snacks.picker.git_status()
            end,
            desc = "[s]tatus",
        },
        {
            "<leader>gS",
            function()
                Snacks.picker.git_stash()
            end,
            desc = "[S]tash",
        },
        {
            "<leader>gd",
            function()
                Snacks.picker.git_diff()
            end,
            desc = "[d]iff",
        },
        {
            "<leader>gf",
            function()
                Snacks.picker.git_log_file()
            end,
            desc = "current [f]ile history",
        },
        -- gh
        {
            "<leader>Gi",
            function()
                Snacks.picker.gh_issue()
            end,
            desc = "[i]ssues",
        },
        {
            "<leader>GI",
            function()
                Snacks.picker.gh_issue({ state = "all" })
            end,
            desc = "[I]ssues",
        },
        {
            "<leader>Gp",
            function()
                Snacks.picker.gh_pr()
            end,
            desc = "Open [p]ull requests",
        },
        {
            "<leader>GP",
            function()
                Snacks.picker.gh_pr({ state = "all" })
            end,
            desc = "[P]ull Requests",
        },
        {
            "<leader>/",
            function()
                Snacks.picker.lines()
            end,
            desc = "grep in buffer",
        },
        {
            "<leader>s",
            function()
                Snacks.picker.grep()
            end,
            desc = "grep [s]earch",
        },
        {
            "<leader>S",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "grep [S]election",
            mode = { "n", "x" },
        },
        {
            '<leader>"',
            function()
                Snacks.picker.registers()
            end,
            desc = "registers",
        },
        {
            "<leader>?",
            function()
                Snacks.picker.search_history()
            end,
            desc = "search history",
        },
        {
            "<leader>ha",
            function()
                Snacks.picker.autocmds()
            end,
            desc = "[a]utocmds",
        },
        {
            "<leader>hc",
            function()
                Snacks.picker.commands()
            end,
            desc = "[c]ommands",
        },
        {
            "<leader>ld",
            function()
                Snacks.picker.diagnostics()
            end,
            desc = "[d]iagnostics",
        },
        {
            "<leader>lD",
            function()
                Snacks.picker.diagnostics_buffer()
            end,
            desc = "buffer [D]iagnostics",
        },
        {
            "<leader>hh",
            function()
                Snacks.picker.help()
            end,
            desc = "[h]elp",
        },
        {
            "<leader>hH",
            function()
                Snacks.picker.highlights()
            end,
            desc = "[H]ighlights",
        },
        {
            "<leader>i",
            function()
                Snacks.picker.icons()
            end,
            desc = "[i]cons",
        },
        {
            "<leader>j",
            function()
                Snacks.picker.jumps()
            end,
            desc = "[j]umps",
        },
        {
            "<leader>hk",
            function()
                Snacks.picker.keymaps()
            end,
            desc = "[k]eymaps",
        },
        {
            "<leader>L",
            function()
                Snacks.picker.loclist()
            end,
            desc = "[L]ocation list",
        },
        {
            "<leader>m",
            function()
                Snacks.picker.marks()
            end,
            desc = "[m]arks",
        },
        {
            "<leader>hm",
            function()
                Snacks.picker.man()
            end,
            desc = "[m]an pages",
        },
        {
            "<leader>q",
            function()
                Snacks.picker.qflist()
            end,
            desc = "[q]uickfix list",
        },
        {
            "<leader>u",
            function()
                Snacks.picker.undo()
            end,
            desc = "[u]ndo history",
        },
        -- LSP
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "Goto Definition",
        },
        {
            "gD",
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = "Goto Declaration",
        },
        {
            "grr",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "gri",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Goto Implementation",
        },
        {
            "gy",
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = "Goto T[y]pe Definition",
        },
        {
            "gai",
            function()
                Snacks.picker.lsp_incoming_calls()
            end,
            desc = "C[a]lls Incoming",
        },
        {
            "gao",
            function()
                Snacks.picker.lsp_outgoing_calls()
            end,
            desc = "C[a]lls Outgoing",
        },
        {
            "<leader>ls",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "(l)sp (s)ymbols",
        },
        {
            "<leader>lS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "[l]sp workspace [S]ymbols",
        },
        {
            "<leader>fr",
            function()
                Snacks.rename.rename_file()
            end,
            desc = "[r]ename",
        },
        {
            "<c-`>",
            function()
                Snacks.terminal()
            end,
            desc = "Toggle Terminal",
        },
        {
            "]]",
            function()
                Snacks.words.jump(vim.v.count1)
            end,
            desc = "Next Reference",
            mode = { "n", "t" },
        },
        {
            "[[",
            function()
                Snacks.words.jump(-vim.v.count1)
            end,
            desc = "Prev Reference",
            mode = { "n", "t" },
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end

                -- Override print to use snacks for `:=` command
                if vim.fn.has("nvim-0.11") == 1 then
                    vim._print = function(_, ...)
                        dd(...)
                    end
                else
                    vim.print = _G.dd
                end

                -- Create some toggle mappings
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>ts")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL")
                Snacks.toggle.diagnostics():map("<leader>td")
                Snacks.toggle.line_number():map("<leader>tl")
                Snacks.toggle
                    .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                    :map("<leader>tc")
                Snacks.toggle.treesitter():map("<leader>tT")
                Snacks.toggle
                    .option("background", { off = "light", on = "dark", name = "Dark Background" })
                    :map("<leader>tt")
                Snacks.toggle.inlay_hints():map("<leader>th")
                Snacks.toggle.indent():map("<leader>ti")
                Snacks.toggle.dim():map("<leader>tD")
            end,
        })
    end,
}
