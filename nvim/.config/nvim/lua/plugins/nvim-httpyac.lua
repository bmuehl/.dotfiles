return {
	"abidibo/nvim-httpyac",
	config = function()
		require("nvim-httpyac").setup()
		-- if you want to set up the keymaps
		vim.keymap.set("n", "<Leader>x", "<cmd>:NvimHttpYac<CR>", { desc = "Run request" })
		vim.keymap.set("n", "<Leader>xx", "<cmd>:NvimHttpYacAll<CR>", { desc = "Run all requests" })
	end,
}
