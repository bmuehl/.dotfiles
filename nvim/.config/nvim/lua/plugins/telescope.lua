return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "CFLAGS=-march=native make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local utils = require("telescope.utils")

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
						["<C-o>"] = actions.send_to_qflist + actions.open_qflist, -- send all to quickfixlist
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>fd", function()
			builtin.live_grep({ search_dirs = { utils.buffer_dir() } })
		end) -- find string in current buffer directory as you type

		telescope.load_extension("fzf")
	end,
}
