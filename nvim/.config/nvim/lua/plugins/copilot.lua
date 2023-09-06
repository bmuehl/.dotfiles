return {
	"github/copilot.vim",
	event = "InsertEnter",
	config = function()
		local named_colors = require("catppuccin.palettes").get_palette("frappe")
		vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = named_colors.overlay0, italic = true })
	end
}
