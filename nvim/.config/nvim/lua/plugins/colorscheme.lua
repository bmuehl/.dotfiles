return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- make sure to load this before all the other plugins
	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({
			flavor = "mocha",
			transparent_background = false,
			integrations = {
				mason = true,
				leap = true,
				neotree = true,
			},
		})

		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}
