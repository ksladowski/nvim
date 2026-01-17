local neogit = require("neogit")

-- open using defaults
-- neogit.open()
--
-- -- open a specific popup
-- neogit.open({ "commit" })
--
-- -- open as a split
-- neogit.open({ kind = "split" })
--
-- -- open with different project
-- neogit.open({ cwd = "~" })

-- You can map this to a key
vim.keymap.set("n", "<leader>gg", neogit.open, { desc = "Open Neogit UI" })

-- Wrap in a function to pass additional arguments
vim.keymap.set("n", "<leader>gg", function()
    neogit.open({ kind = "auto" })
end, { desc = "Open Neogit UI" })
