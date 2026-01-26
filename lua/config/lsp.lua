vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
    severity_sort = true,
    float = {
        border = "rounded",
        format = function(d)
            return ("%s (%s) [%s]"):format(d.message, d.source, d.code or d.user_data.lsp.code)
        end,
    },
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "󰋼",
            [vim.diagnostic.severity.HINT] = "󰌵",
        },
    },
    underline = true,
    jump = {
        float = true,
    },
})
