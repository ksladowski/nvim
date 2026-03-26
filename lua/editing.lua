-- Dial
vim.pack.add({ "https://github.com/monaqa/dial.nvim" })

local augend = require("dial.augend")
require("dial.config").augends:register_group{
  -- default augends used when no group name is specified
  default = {
    augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
    augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.date.alias["%Y/%m/%d"],  -- date (2022/02/19, etc.)
  },
  }

vim.keymap.set("n", "<C-a>", function()
    require("dial.map").manipulate("increment", "normal")
end)
vim.keymap.set("n", "<C-x>", function()
    require("dial.map").manipulate("decrement", "normal")
end)
vim.keymap.set("n", "g<C-a>", function()
    require("dial.map").manipulate("increment", "gnormal")
end)
vim.keymap.set("n", "g<C-x>", function()
    require("dial.map").manipulate("decrement", "gnormal")
end)

-- Flash
vim.pack.add({"https://github.com/folke/flash.nvim"})

local flashopts = {
highlight = {
    backdrop = false,
    matches = false,
    priority = 5000,
    groups = {
      label = "FlashMatch",
    },
  },
  modes = {
    -- options used when flash is activated through
    -- `f`, `F`, `t`, `T`, `;` and `,` motions
    char = {
      jump_labels = true,
      highlight = {
          backdrop = false
      },
    },
    treesitter = {
      jump = { pos = "range", autojump = true },
      search = { incremental = false },
      label = { before = true, after = true, style = "inline" },
      highlight = {
        backdrop = false,
        matches = false,
      },
    },
    treesitter_search = {
      jump = { pos = "range" },
      search = { multi_window = true, wrap = true, incremental = false },
      remote_op = { restore = true },
      label = { before = true, after = true, style = "inline" },
    },
  },
  prompt = {
    prefix = { { "󱐋", "FlashPromptIcon" } },
  },
      remote_op = { restore = true, motion = true },
}

require("flash").setup(flashopts) -- to activate fFtT

vim.keymap.set({"n", "x", "o"}, "s", function()
    require("flash").jump(flashopts)
end)
vim.keymap.set({"n", "x", "o"}, "S", function()
    require("flash").treesitter(flashopts)
end)
vim.keymap.set({"x", "o"}, "r", function()
    require("flash").remote(flashopts)
end)
vim.keymap.set({"x", "o"}, "R", function()
    require("flash").treesitter_search(flashopts)
end)
