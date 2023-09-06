return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { 
		"nvim-lua/plenary.nvim",
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			-- configure custom mappings
			defaults = {
				file_ignore_patterns = { "node_modules", "target", ".git" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
					},
				},
			},
		})

		telescope.load_extension("fzf")
	end
}

