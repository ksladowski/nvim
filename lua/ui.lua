vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
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

vim.pack.add({ "https://github.com/neanias/everforest-nvim" }, { confirm = false })
