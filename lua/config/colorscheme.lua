require('catppuccin').setup {
	flavour = 'mocha',
	default_integrations = false,
	transparent_background = true,
	float = { transparent = true },
        -- Dim inactive doesn't play well with transparency. Not sure how I feel yet
        -- dim_inactive = { enabled = true },
	highlight_overrides = {
		all = {
			-- Brighter line numbers
			LineNr = { fg = "#b5bfe2" },
			-- Highlight current line number
			CursorLineNr = { fg = "#eed49f", bold = true },
		},
	},
}
vim.cmd.colorscheme 'catppuccin'
