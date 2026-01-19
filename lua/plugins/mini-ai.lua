return {
    {
        "nvim-mini/mini.ai",
        config = function()
            require("mini.ai").setup()
        end,
    },
    {
        "nvim-mini/mini.extra",
        config = function()
            require("mini.extra").setup()
        end,
    },
}
