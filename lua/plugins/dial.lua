local augend = require("dial.augend")
require("dial.config").augends:register_group({
    default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
    },
    only_in_visual = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
    },
})

-- Use `only_in_visual` group only in VISUAL <C-a> / <C-x>
vim.keymap.set("x", "<C-a>", function()
    require("dial.map").manipulate("increment", "visual", "only_in_visual")
end)
vim.keymap.set("x", "<C-x>", function()
    require("dial.map").manipulate("decrement", "visual", "only_in_visual")
end)

require("dial.config").augends:on_filetype({
    typescript = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.constant.new({ elements = { "let", "const" } }),
    },
})
