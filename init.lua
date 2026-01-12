-- TODO LIST --
-- oil.nvim
-- treesitter
-- lsp
-- dotnet
-- markdown
-- linters
-- vimwiki or similar
-- which key
-- breadcrumbs?
-- nvim-cmp completion
-- snippets
-- standardize git status symbols across all plugins (modeline, nvim-tree, etc)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- <C-\><C-n> is the default to exit terminal mode
-- Allow EscEsc instead
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<M-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<M-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<M-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<M-n>", "gt", { desc = "Go to the next tab page" })
vim.keymap.set("n", "<M-p>", "gT", { desc = "Go to the previous tab page" })

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

require("config.lazy")

return

--   -- LSP Plugins
--   { -- Autocompletion
--     'saghen/blink.cmp',
--     event = 'VimEnter',
--     version = '1.*',
--     dependencies = {
--       -- Snippet Engine
--       {
--         'L3MON4D3/LuaSnip',
--         version = '2.*',
--         build = (function()
--           -- Build Step is needed for regex support in snippets.
--           -- This step is not supported in many windows environments.
--           -- Remove the below condition to re-enable on windows.
--           if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
--             return
--           end
--           return 'make install_jsregexp'
--         end)(),
--         dependencies = {
--           -- `friendly-snippets` contains a variety of premade snippets.
--           --    See the README about individual language/framework/plugin snippets:
--           --    https://github.com/rafamadriz/friendly-snippets
--           -- {
--           --   'rafamadriz/friendly-snippets',
--           --   config = function()
--           --     require('luasnip.loaders.from_vscode').lazy_load()
--           --   end,
--           -- },
--         },
--         opts = {},
--       },
--       'folke/lazydev.nvim',
--     },
--     --- @module 'blink.cmp'
--     --- @type blink.cmp.Config
--     opts = {
--       keymap = {
--         -- 'default' (recommended) for mappings similar to built-in completions
--         --   <c-y> to accept ([y]es) the completion.
--         --    This will auto-import if your LSP supports it.
--         --    This will expand snippets if the LSP sent a snippet.
--         -- 'super-tab' for tab to accept
--         -- 'enter' for enter to accept
--         -- 'none' for no mappings
--         --
--         -- For an understanding of why the 'default' preset is recommended,
--         -- you will need to read `:help ins-completion`
--         --
--         -- No, but seriously. Please read `:help ins-completion`, it is really good!
--         --
--         -- All presets have the following mappings:
--         -- <tab>/<s-tab>: move to right/left of your snippet expansion
--         -- <c-space>: Open menu or open docs if already open
--         -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
--         -- <c-e>: Hide menu
--         -- <c-k>: Toggle signature help
--         --
--         -- See :h blink-cmp-config-keymap for defining your own keymap
--         preset = 'default',
--
--         -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
--         --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
--       },
--
--       appearance = {
--         -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
--         -- Adjusts spacing to ensure icons are aligned
--         nerd_font_variant = 'mono',
--       },
--
--       completion = {
--         -- By default, you may press `<c-space>` to show the documentation.
--         -- Optionally, set `auto_show = true` to show the documentation after a delay.
--         documentation = { auto_show = false, auto_show_delay_ms = 500 },
--       },
--
--       sources = {
--         default = { 'lsp', 'path', 'snippets', 'lazydev' },
--         providers = {
--           lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
--         },
--       },
--
--       snippets = { preset = 'luasnip' },
--
--       -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
--       -- which automatically downloads a prebuilt binary when enabled.
--       --
--       -- By default, we use the Lua implementation instead, but you may enable
--       -- the rust implementation via `'prefer_rust_with_warning'`
--       --
--       -- See :h blink-cmp-config-fuzzy for more information
--       fuzzy = { implementation = 'lua' },
--
--       -- Shows a signature help window while you type arguments for a function
--       signature = { enabled = true },
--     },
--   },
--
--   { -- Collection of various small independent plugins/modules
--     'echasnovski/mini.nvim',
--     config = function()
--       -- Better Around/Inside textobjects
--       --
--       -- Examples:
--       --  - va)  - [V]isually select [A]round [)]paren
--       --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--       --  - ci'  - [C]hange [I]nside [']quote
--       require('mini.ai').setup { n_lines = 500 }
--
--       -- Add/delete/replace surroundings (brackets, quotes, etc.)
--       --
--       -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
--       -- - sd'   - [S]urround [D]elete [']quotes
--       -- - sr)'  - [S]urround [R]eplace [)] [']
--       require('mini.surround').setup()
--
--       -- Simple and easy statusline.
--       --  You could remove this setup call if you don't like it,
--       --  and try some other statusline plugin
--       local statusline = require 'mini.statusline'
--       -- set use_icons to true if you have a Nerd Font
--       statusline.setup { use_icons = vim.g.have_nerd_font }
--
--       -- You can configure sections in the statusline by overriding their
--       -- default behavior. For example, here we set the section for
--       -- cursor location to LINE:COLUMN
--       ---@diagnostic disable-next-line: duplicate-set-field
--       statusline.section_location = function()
--         return '%2l:%-2v'
--       end
--
--       -- ... and there is more!
--       --  Check out: https://github.com/echasnovski/mini.nvim
--     end,
