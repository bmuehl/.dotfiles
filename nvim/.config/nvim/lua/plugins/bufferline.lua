return {
	"akinsho/bufferline.nvim",
	event = "BufEnter",
	dependencies = { "nvim-tree/nvim-web-devicons", "ojroques/nvim-bufdel" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		local highlights = require("catppuccin.groups.integrations.bufferline").get()()
		local named_colors = require("catppuccin.palettes").get_palette("mocha")

		if highlights.fill.bg == "NONE" then
			local color = named_colors.base
			highlights.fill.bg = color -- set bg for transparent mode
			highlights.separator.fg = color
			highlights.separator_selected.fg = color
			highlights.separator_visible.fg = color
		end

		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						separator = false,
					},
				},
				separator_style = "slant",
				close_command = "BufDel! %d",
				right_mouse_command = "BufDel! %d",
			},
			highlights = highlights,
		})
	end,
}
