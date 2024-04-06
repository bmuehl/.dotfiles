return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				php = { "php_cs_fixer" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			},
		})

		conform.formatters.php_cs_fixer = {
			args = {
				"--no-interaction",
				"--quiet",
				"--allow-risky=yes",
				"fix",
				"$FILENAME",
			},
		}

		conform.formatters.black = {
			prpend_args = { "--fast" },
		}

		vim.keymap.set({ "n", "v" }, "<leader>fo", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
