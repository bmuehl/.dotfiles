-- set colorscheme with protected call in case it isn't installed
local status, nord = pcall(require, "nord")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

vim.g.nord_disable_background = true
vim.g.nord_italic = false

nord.set()

vim.cmd([[colorscheme nord]])
