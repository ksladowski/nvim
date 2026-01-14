vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
  severity_sort = true,
  signs = true, -- TODO icons
  float = {
    border = "rounded",
  },
  virtual_text = true,
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('nil_ls')
