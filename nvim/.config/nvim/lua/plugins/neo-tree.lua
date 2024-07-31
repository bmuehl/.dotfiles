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

		neotree.setup({
			auto_clean_after_session_restore = true,
			window = {
				auto_expand_width = false, -- toggle with e
			},
			git_status_async = false,
			filesystem = {
				use_libuv_file_watcher = true,
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
				},
			},
		})
	end,
}
