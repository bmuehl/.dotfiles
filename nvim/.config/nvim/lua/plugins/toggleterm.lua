return {
	"akinsho/toggleterm.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local toggleterm = require("toggleterm")

		toggleterm.setup()

		local Terminal = require("toggleterm.terminal").Terminal

		-- setup lazygit
		local lazygit = Terminal:new({
			cmd = "lazygit",
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "curved",
			},
			on_close = function()
				require("neo-tree.sources.manager").refresh("filesystem")
			end,
		})

		function LazyGitToggle()
			lazygit:toggle()
		end

		-- keymap
		vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua LazyGitToggle()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
	end
}
