return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		local colors = require("catppuccin.palettes").get_palette("mocha")
		vim.api.nvim_set_hl(0, "CodeiumSuggestion", { fg = colors.overlay0, italic = true })
	end,
}
