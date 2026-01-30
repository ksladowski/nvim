return {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua" },
    lazy = true,
    cmd = "Dotnet",
    ft = { "cs", "csproj", "sln", "slnx" },
    config = function()
        local dotnet = require("easy-dotnet")
        dotnet.setup()
        require("blink.cmp").add_provider("easy-dotnet", {
            name = "easy-dotnet",
            enabled = true,
            module = "easy-dotnet.completion.blink",
            score_offset = 10000,
            async = true,
        })
    end,
}
