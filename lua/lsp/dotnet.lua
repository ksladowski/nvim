vim.pack.add({ "https://github.com/seblyng/roslyn.nvim" })
require("roslyn").setup()

local rzls_path = vim.fn.expand("/home/kevin/Downloads/microsoft.codeanalysis.languageserver.linux-x64/.razorExtension")
local razor_path = vim.env.ROSLYN_LSP_PATH

local cmd = {
    "dotnet",
    vim.fs.joinpath(razor_path, ".roslyn", "Microsoft.CodeAnalysis.LanguageServer.dll"),
    "--stdio",
    "--logLevel=Information",
    "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
    "--razorSourceGenerator="
        .. vim.fs.joinpath(razor_path, ".razorExtension", "Microsoft.CodeAnalysis.Razor.Compiler.dll"),
    "--razorDesignTimePath="
        .. vim.fs.joinpath(razor_path, ".razorExtension", "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
    "--extension=" .. vim.fs.joinpath(razor_path, ".razorExtension", "Microsoft.VisualStudioCode.RazorExtension.dll"),
}

vim.lsp.config("roslyn", {
    cmd = cmd,
    capabilities = {
        textDocument = {
            colorProvider = nil, -- Tell the server/client this isn't supported
        },
    },
})
