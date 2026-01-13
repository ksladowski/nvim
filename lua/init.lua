require("lua.config.keybinds")
require("lua.config.colorscheme")

vim.g.have_nerd_font = false

vim.o.number = true

vim.o.mouse = "a"
-- remove "How-to disable mouse" from right click menu
vim.cmd([[
  aunmenu PopUp.How-to\ disable\ mouse
  aunmenu PopUp.\-2-
]])

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Use OS clipboard
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true

-- Save undo history
-- Goes in ~/.local/state by default
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
-- This is margins for stuff like git statuses and breakpoints
vim.o.signcolumn = "yes"

-- Decrease update time (for .swp files and such)
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.expandtab = true

vim.o.inccommand = "split"

vim.o.cursorline = true

vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

require("lua.plugins.fzf-lua")

return
