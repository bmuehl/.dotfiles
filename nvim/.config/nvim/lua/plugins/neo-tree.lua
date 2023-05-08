-- import nvim-tree plugin safely
local setup, neotree = pcall(require, "neo-tree")
if not setup then
	return
end

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

neotree.setup({
	window = {
		auto_expand_width = false, -- toggle with e
	},
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
		},
	},
})

-- define custom highlight groups
local status = pcall(require, "catppuccin")
if not status then
	print("Colorscheme not found!")
	return
end
local named_colors = require("catppuccin.palettes").get_palette("frappe")

-- not supported by theme yet
vim.api.nvim_set_hl(0, "NeoTreeDimText", { fg = named_colors.overlay0 })
vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = named_colors.overlay0 })

vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { fg = named_colors.peach })
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = named_colors.peach })
