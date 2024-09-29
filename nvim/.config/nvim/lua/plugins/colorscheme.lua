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
				if transparent_background then
					return {
						CursorLine = { bg = colors.surface1 },
						LineNr = { fg = colors.blue },
						EndOfBuffer = { fg = colors.surface1 },
						DashboardHeader = { fg = colors.blue },
						DashboardFooter = { fg = colors.surface2 },
						NeoTreeNormal = { bg = colors.mantle },
						NeoTreeNormalNC = { bg = colors.mantle },
						NeoTreeWinSeparator = { bg = colors.mantle, fg = colors.mantle },
					}
				end
				return {}
			end,
		})

		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}
