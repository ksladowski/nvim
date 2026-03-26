-- Built-In
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    nbsp = "␣",
}
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.breakindent = true -- wrapped lines match indentation
vim.opt.inccommand = "split" -- Preview substitutions live

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Colorscheme
vim.pack.add({ "https://github.com/neanias/everforest-nvim" }, { confirm = false })
require("everforest").setup({})
require("everforest").load()

-- Statusline
local mode_map = {
  ['NORMAL'] = 'N',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = 'I',
  ['VISUAL'] = 'V',
  ['V-BLOCK'] = 'VB',
  ['V-LINE'] = 'VL',
  ['V-REPLACE'] = 'VR',
  ['REPLACE'] = 'R',
  ['COMMAND'] = '!',
  ['SHELL'] = 'SH',
  ['TERMINAL'] = 'T',
  ['EX'] = 'X',
  ['S-BLOCK'] = 'SB',
  ['S-LINE'] = 'SL',
  ['SELECT'] = 'S',
  ['CONFIRM'] = 'Y?',
  ['MORE'] = 'M',
}
vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" }, { confirm = false})
require("lualine").setup({
options = {  disabled_filetypes = { 'neo-tree' } },
sections = {
    lualine_a = { {'mode', fmt = function(s) return mode_map[s] or s end} },
  }
})

-- Indent guides
vim.pack.add({ 'https://github.com/saghen/blink.indent' })
