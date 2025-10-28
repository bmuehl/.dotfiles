return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		-- Helper to choose formatter based on project type
		local function deno_or_prettier(bufnr)
			local fname = vim.api.nvim_buf_get_name(bufnr)
			if vim.fs.root(fname, { "deno.json", "deno.jsonc" }) then
				return {} -- Use LSP fallback (denols)
			end
			return { "prettier" }
		end

		conform.setup({
			formatters_by_ft = {
				javascript = deno_or_prettier,
				typescript = deno_or_prettier,
				javascriptreact = deno_or_prettier,
				typescriptreact = deno_or_prettier,
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
