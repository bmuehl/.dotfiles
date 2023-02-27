-- define custom highlight groups
local status = pcall(require, "nord")
if not status then
	print("Colorscheme not found!")
	return
end
local named_colors = require("nord.named_colors")

vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = named_colors.light_gray_bright })
