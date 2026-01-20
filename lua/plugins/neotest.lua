return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "TimCreasman/neo-tree-tests-source.nvim",
    },
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            consumers = {
                neotree = require("neotest.consumers.neotree"),
            },
        })
    end,
}
