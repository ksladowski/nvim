return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>=",
            function()
                require("conform").format({ async = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        notify_on_error = false,
        formatters_by_ft = {
            lua = { "stylua" },
            cs = { "csharpier" },
            nix = { "nixfmt" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        format_on_save = { timeout_ms = 500 },
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
            },
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
