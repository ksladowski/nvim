return {
    "nvim-mini/mini.move",
    dependencies = {
        "nvim-mini/mini.clue",
    },
    config = function()
        require("mini.move").setup({
            mappings = {
                left = "<Leader>Mh",
                right = "<Leader>Ml",
                down = "<Leader>Mj",
                up = "<Leader>Mk",
                line_left = "<Leader>Mh",
                line_right = "<Leader>Ml",
                line_down = "<Leader>Mj",
                line_up = "<Leader>Mk",
            },
        })

        local clues = require("mini.clue").config.clues
        table.insert(clues, { mode = "n", keys = "<Leader>M", desc = "+[M]ove" })
        table.insert(clues, { mode = { "n", "x" }, keys = "<Leader>Mh", postkeys = "<Leader>M" })
        table.insert(clues, { mode = { "n", "x" }, keys = "<Leader>Mj", postkeys = "<Leader>M" })
        table.insert(clues, { mode = { "n", "x" }, keys = "<Leader>Mk", postkeys = "<Leader>M" })
        table.insert(clues, { mode = { "n", "x" }, keys = "<Leader>Ml", postkeys = "<Leader>M" })
    end,
}
