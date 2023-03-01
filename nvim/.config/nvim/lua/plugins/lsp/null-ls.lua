-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
		formatting.prettier.with({
			filetypes = {
				"html",
				"json",
				"svelte",
				"vue",
				"markdown",
				"css",
				"scss",
				"sass",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
		}), -- js/ts formatter
		formatting.stylua, -- lua formatter
		formatting.black.with({ extra_args = { "--fast" } }), -- python formatter
		formatting.phpcsfixer.with({
			args = {
				"--no-interaction",
				"--quiet",
				"--allow-risky=yes",
				"fix",
				"$FILENAME",
			},
		}), -- php formatter
		formatting.google_java_format, -- java formatting
		diagnostics.eslint_d.with({ -- js/ts linter
			-- only enable eslint if root has .eslintrc.js
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
			end,
		}),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						timeout_ms = 2000,
						filter = function(clients)
							return vim.tbl_filter(function(client)
								return pcall(function(_client)
									return _client.config.settings.autoFixOnSave or false
								end, client) or false
							end, clients)
						end,
					})
				end,
			})
		end
	end,
})
