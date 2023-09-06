return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
	},
	config = function()
		local neotree = require("neo-tree")

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
	end
}
