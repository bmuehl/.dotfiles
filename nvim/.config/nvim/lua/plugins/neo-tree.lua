return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local neotree = require("neo-tree")

		neotree.setup({
			auto_clean_after_session_restore = true,
			window = {
				auto_expand_width = false, -- toggle with e
			},
			enable_git_status = true,
			git_status_async = true,
			filesystem = {
				use_libuv_file_watcher = true, -- This will use the OS level file watchers
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
				},
			},
		})
	end,
}
