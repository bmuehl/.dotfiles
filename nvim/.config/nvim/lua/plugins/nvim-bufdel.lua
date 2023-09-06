return {
	"ojroques/nvim-bufdel",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		next = "tabs",
		quit = true, -- quit Neovim when last buffer is closed
	}
}
