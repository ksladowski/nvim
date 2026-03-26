vim.pack.add({ "https://github.com/nvim-neo-tree/neo-tree.nvim" })
  require('neo-tree').setup({
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          -- This effectively hides the cursor
          vim.cmd 'highlight! Cursor blend=100'
        end
      },
      {
        event = "neo_tree_buffer_leave",
        handler = function()
          -- Make this whatever your current Cursor highlight group is.
          vim.cmd 'highlight! Cursor guibg=reverse blend=0'
        end
      }
    },
sources = {
      'filesystem',
      'git_status',
      'document_symbols',
    },
    source_selector = {
      winbar = true,
      sources = {
        { source = 'filesystem', display_name = ' 󰉓 File ' },
        { source = 'git_status', display_name = ' 󰊢 Git ' },
        { source = 'document_symbols', display_name = '  Sym ' },
      },
      content_layout = 'center',
    },
window = {
      mappings = {
        ['h'] = function(state)
          local node = state.tree:get_node()
          if (node.type == 'directory' or node:has_children()) and node:is_expanded() then
            state.commands.toggle_node(state)
          else
            require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
          end
        end,
        -- Open on file or closed directory, or jump down to top subdirectory on open directory
        ['l'] = function(state)
          local node = state.tree:get_node()
          if node.type == 'directory' or node:has_children() then
            if not node:is_expanded() then
              state.commands.toggle_node(state)
            else
              require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
            end
          else
            require('neo-tree.sources.filesystem.commands').open(state)
          end
        end,
      },
    },
  })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree<cr>", { desc = "Neotree" })

vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup()
vim.keymap.set("n", "<leader>E", "<cmd>Oil<cr>", { desc = "Oil" })
