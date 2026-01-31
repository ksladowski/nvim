return {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua" },
    lazy = true,
    cmd = "Dotnet",
    ft = { "cs", "csproj", "sln", "slnx" },
    config = function()
        local dotnet = require("easy-dotnet")
        dotnet.setup()
    end,
}
