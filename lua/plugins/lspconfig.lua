return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.enable("lua_ls")
        vim.lsp.config("lua_ls", {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath("config")
                        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    runtime = {
                        version = "LuaJIT",
                        -- (see `:h lua-module-load`)
                        path = {
                            "lua/?.lua",
                            "lua/?/init.lua",
                        },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            "${3rd}/luv/library",
                            -- "${3rd}/busted/library",
                        },
                    },
                })
            end,
            settings = {
                Lua = {},
            },
        })
    end,

    vim.lsp.enable("nil_ls"),
    vim.lsp.config("nil_ls", {
        settings = {
            ["nil"] = {
                nix = {
                    flake = {
                        -- calls `nix flake archive` to put a flake and its output to store
                        autoArchive = false,
                    },
                },
            },
        },
    }),
    vim.lsp.enable("markdown_oxide"),
    vim.lsp.enable("pylsp"),
    vim.lsp.enable("ts_ls"),
}
