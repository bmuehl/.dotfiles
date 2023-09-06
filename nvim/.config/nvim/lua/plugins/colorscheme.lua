return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- make sure to load this before all the other plugins
	config = function()
		local catppuccin = require("catppuccin")

		catppuccin.setup({
			flavor = "mocha",
			transparent_background = false,
		})

		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}
