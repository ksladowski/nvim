return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gitsigns.nav_hunk("next")
                end
            end, { desc = "Jump to next git [c]hange" })

            map("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gitsigns.nav_hunk("prev")
                end
            end, { desc = "Jump to previous git [c]hange" })

            -- Actions
            -- visual mode
            map("v", "<leader>ghs", function()
                gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "git [s]tage hunk" })
            map("v", "<leader>ghr", function()
                gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "git [r]eset hunk" })
            -- normal mode
            map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
            map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
            map("n", "<leader>ghu", gitsigns.stage_hunk, { desc = "git [u]ndo stage hunk" })
            map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
        end,
    },
}
