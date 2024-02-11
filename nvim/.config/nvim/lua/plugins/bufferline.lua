return {
	"akinsho/bufferline.nvim",
	event = "BufEnter",
	dependencies = { "nvim-tree/nvim-web-devicons", "ojroques/nvim-bufdel" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		local highlights = require("catppuccin.groups.integrations.bufferline").get()()
		local named_colors = require("catppuccin.palettes").get_palette("mocha")

		highlights["fill"]["bg"] = named_colors.surface1 -- set bg for transparent mode

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
