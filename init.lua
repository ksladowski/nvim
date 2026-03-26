vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- system clipboard integration
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- 0 uses tabstop value
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true -- changes autoindent behavior to auto indent functions

vim.opt.swapfile = false
vim.opt.autoread = true -- Monitor open files for changes
vim.opt.undofile = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear highlights on search when pressing <Esc> in normal mode

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

vim.opt.confirm = true

-- Plugin dependencies
vim.pack.add({"https://github.com/nvim-lua/plenary.nvim"})
vim.pack.add({"https://github.com/nvim-tree/nvim-web-devicons"})
vim.pack.add({"https://github.com/MunifTanjim/nui.nvim"})
vim.pack.add({"https://github.com/3rd/image.nvim"})

require("ui")
require("windows")
require("fzf")
require("git")
require("filemanager")
require("editing")

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },

    -- Can switch between these as you prefer
    virtual_text = true, -- Text shows up at the end of the line
    -- virtual_lines = false, -- Text shows up underneath the line, with virtual lines

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = { float = true },

    update_in_insert = false,
    severity_sort = true,
    float = { border = "rounded", source = "if_many" },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },
})

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
