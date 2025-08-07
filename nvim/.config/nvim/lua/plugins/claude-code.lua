return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for git operations
	},
	config = function()
		require("claude-code").setup({
			window = {
				position = "vertical",
			},
			keymaps = {
				toggle = {
					normal = "<leader> ",
					terminal = "<leader> ",
				},
			},
		})
		vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
	end,
}
