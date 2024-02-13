return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- make sure to load this before all the other plugins
	config = function()
		local catppuccin = require("catppuccin")
		local named_colors = require("catppuccin.palettes").get_palette("mocha")
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
			},
		})

		if transparent_background then
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					vim.api.nvim_set_hl(0, "CursorLine", { bg = named_colors.surface1 })
				end,
			})
		end

		vim.cmd([[colorscheme catppuccin-mocha]])
	end,
}
