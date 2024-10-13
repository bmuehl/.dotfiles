return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- make sure to load this before all the other plugins
	config = function()
		local catppuccin = require("catppuccin")
		local transparent_background = true

		catppuccin.setup({
			flavor = "mocha",
			transparent_background = transparent_background,
			integrations = {
				mason = true,
				leap = true,
				neotree = true,
				noice = true,
				notify = true,
				indent_blankline = true,
			},
			custom_highlights = function(colors)
				return {
					CursorLine = { bg = colors.surface1 },
					LineNr = { fg = colors.surface1 },
					EndOfBuffer = { fg = colors.surface1 },
					IblIndent = { fg = colors.surface1 },
					IblScope = { fg = colors.surface2 },
				}
			end,
		})

		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}
