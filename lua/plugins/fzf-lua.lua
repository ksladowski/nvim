require("fzf-lua").setup({
-- TODO configure previewers

  -- Set up basic vim bindings.
  keymap = {
    fzf = {
      true, -- Inherit from default fzf keybinds
      jump = "accept",

      -- Normal (ish) mode keybinds.
      ["ctrl-j"] = "down",
      ["ctrl-k"] = "up",
      ["ctrl-l"] = "accept",
      ["ctrl-f"] = "jump",
    },
    builtin = {
      true,
      ["<A-j>"] = "preview-down",
      ["<A-k>"] = "preview-up",
      ["<C-Space>"] = "toggle-preview",
    },
  },

  -- Autoselect current document symbol in `:FzfLua lsp_document_symbols` (bound
  -- to gO by default)
  lsp = {
    symbols = {
      locate = true,
    },
  },

  buffers = {
    fzf_opts = {
      ["--header-lines"] = false,
    },

    actions = {
      ["ctrl-x"] = {
        reload = true,
        fn = delete_buffer_action,
      },
    },

    keymap = {
      fzf = {
        -- Buffer picker shouldn't start on the current buffer
        -- TODO: find a way to not trigger this when closing the current buffer
        load = "pos(2)",
      },
    },

    -- We want to show helpfiles, but they're unlisted - so we allow all
    -- unlisted buffers, but filter them for only helpfiles
    show_unlisted = true,
    filter = filter_unlisted_buffers,
  },

  files = {
    -- Changed from the default to also remove .direnv
    fd_opts = "--color=never --hidden --type f --type l --exclude .git --exclude .direnv",
  },

  -- Disable regex for searching - I need special characters much more than I
  -- want regex search
  grep = {
    rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --fixed-strings -e",
  },

  -- Automatically create an fzf colorscheme based on our nvim colorscheme
  -- fzf_colors = true,

  winopts = {
    row = 0.50,
    preview = {
      layout = "vertical",
      vertical = "up:45%",
    },
  },

  fzf_opts = {
    ["--cycle"] = true,
  },
})

FzfLua.register_ui_select()

-- Replace default LSP bindings with fzf-lua equivalents We don't mess with
-- rename and code actions - just actions that use a picker
nnoremap("grr", FzfLua.lsp_references)
nnoremap("gri", FzfLua.lsp_definitions)
nnoremap("grt", FzfLua.lsp_typedefs)
nnoremap("gO", FzfLua.lsp_document_symbols)

-- Not a default bind, but good for some LSPs like gleam, where you want to see
-- diagnostics in other files
nnoremap("grd", FzfLua.diagnostics_workspace)

nnoremap("<leader>b", FzfLua.buffers, { desc = "Swap buffer, including hidden buffers" })

nnoremap("<leader>f", FzfLua.files, { desc = "Add new file in project" })
nnoremap("<leader>F", function()
  FzfLua.files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Add new file in current folder" })

nnoremap("<leader>s", FzfLua.live_grep, { desc = "Search text in project" })
nnoremap("<leader>S", function()
  FzfLua.live_grep({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Search text in current filder" })
