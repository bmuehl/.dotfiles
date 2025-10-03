return {
	"akinsho/bufferline.nvim",
	event = "BufEnter",
	dependencies = { "nvim-tree/nvim-web-devicons", "ojroques/nvim-bufdel" },
	version = "*",
	after = "catppuccin",
	config = function()
		local bufferline = require("bufferline")
		local named_colors = require("catppuccin.palettes").get_palette("mocha")

		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
					},
				},
				separator_style = "slant",
				close_command = "BufDel! %d",
				right_mouse_command = "BufDel! %d",
			},
			highlights = require("catppuccin.special.bufferline").get_theme({
				buffer_visible = {
					fg = named_colors.text,
				},
				duplicate = {
					fg = named_colors.overlay1,
				},
				duplicate_visible = {
					fg = named_colors.text,
				},
			}),
		})
	end,
}
