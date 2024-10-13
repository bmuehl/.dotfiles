return {
	"akinsho/bufferline.nvim",
	event = "BufEnter",
	dependencies = { "nvim-tree/nvim-web-devicons", "ojroques/nvim-bufdel" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		local highlights = require("catppuccin.groups.integrations.bufferline").get()()
		local named_colors = require("catppuccin.palettes").get_palette("mocha")
		local isTransparent = highlights.fill.bg == "NONE"

		highlights.buffer_visible.fg = named_colors.text
		highlights.duplicate.fg = named_colors.overlay1
		highlights.duplicate_visible.fg = named_colors.text

		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						separator = isTransparent,
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
