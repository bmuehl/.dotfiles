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
		vim.cmd([[ set fillchars+=vert:\▏]]) -- set vertical split char to reduce margin

		neotree.setup({
			auto_clean_after_session_restore = true,
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
	end,
}
