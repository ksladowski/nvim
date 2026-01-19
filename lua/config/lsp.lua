vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
    severity_sort = true,
    signs = true,
    float = {
        border = "rounded",
    },
    virtual_text = false,
})

local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

for name, icon in pairs(symbols) do
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end
