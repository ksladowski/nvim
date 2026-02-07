return {
    {
        "nvim-mini/mini.clue",
        config = function()
            local miniclue = require("mini.clue")
            miniclue.setup({
                triggers = {
                    -- Leader triggers
                    { mode = { "n", "x" }, keys = "<Leader>" },

                    -- `[` and `]` keys
                    { mode = "n", keys = "[" },
                    { mode = "n", keys = "]" },

                    -- Built-in completion
                    { mode = "i", keys = "<C-x>" },

                    -- `g` key
                    { mode = { "n", "x" }, keys = "g" },

                    -- Marks
                    { mode = { "n", "x" }, keys = "'" },
                    { mode = { "n", "x" }, keys = "`" },

                    -- Registers
                    { mode = { "n", "x" }, keys = '"' },
                    { mode = { "i", "c" }, keys = "<C-r>" },

                    -- Window commands
                    { mode = "n", keys = "<C-w>" },

                    -- `z` key
                    { mode = { "n", "x" }, keys = "z" },
                },

                clues = {
                    -- Enhance this by adding descriptions for <Leader> mapping groups
                    miniclue.gen_clues.square_brackets(),
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows({
                        submode_move = true,
                        submode_navigate = true,
                        submode_resize = true,
                    }),
                    miniclue.gen_clues.z(),

                    -- Top Level Hints
                    { mode = "n", keys = "<Leader>b", desc = "+Buffers" },

                    { mode = "n", keys = "]b", postkeys = "]" },
                    { mode = "n", keys = "]w", postkeys = "]" },

                    { mode = "n", keys = "[b", postkeys = "[" },
                    { mode = "n", keys = "[w", postkeys = "[" },
                    { mode = "n", keys = "gt", postkeys = "g" },
                    { mode = "n", keys = "gT", postkeys = "g" },
                },

                window = {
                    delay = 300,
                },
            })
        end,
    },
}
