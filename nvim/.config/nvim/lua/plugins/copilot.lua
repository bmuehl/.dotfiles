-- define custom highlight groups
local status = pcall(require, "catppuccin")
if not status then
	print("Colorscheme not found!")
	return
end
local named_colors = require("catppuccin.palettes").get_palette("frappe")

vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = named_colors.overlay0, italic = true })
