-- set colorscheme with protected call in case it isn't installed
local status, catppuccin = pcall(require, "catppuccin")
if not status then
	print("Colorscheme not found!")
	return
end

catppuccin.setup({
	flavor = "frappe",
	transparent_background = true,
})

vim.cmd([[colorscheme catppuccin-frappe]])
