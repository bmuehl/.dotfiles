return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			sync_install = false,
			ignore_install = {},
			modules = {},
			-- enable syntax highlighting
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = { enable = true },
			-- ensure these language parsers are installed
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"typescript",
				"svelte",
				"javascript",
				"html",
				"graphql",
				"php",
				"java",
				"kotlin",
				"json",
				"fish",
				"css",
				"ini",
				"bash",
				"make",
				"python",
				"vue",
				"comment",
				"jsdoc",
				"yaml",
				"http",
			},
			-- auto install above language parsers
			auto_install = true,
		})
	end,
}
