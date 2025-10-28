return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- Configure lua_ls with custom settings
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- Configure emmet_ls with custom filetypes
		vim.lsp.config("emmet_ls", {
			filetypes = {
				"html",
				"typescriptreact",
				"javascriptreact",
				"css",
				"sass",
				"scss",
				"less",
				"svelte",
				"php",
			},
		})

		-- Configure volar for Vue
		vim.lsp.config("volar", {
			filetypes = { "vue" },
			init_options = {
				typescript = {
					tsdk = "/Users/bernhard.muehl/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib", -- fix volar error
				},
			},
		})

		-- Configure cssls with custom capabilities and settings
		vim.lsp.config("cssls", {
			capabilities = (function()
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				capabilities.textDocument.completion.completionItem.snippetSupport = true
				return capabilities
			end)(),
			settings = {
				css = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
				scss = {
					validate = true,
					lint = {
						unknownAtRules = "ignore",
					},
				},
			},
		})

		vim.lsp.config("ts_ls", {
			workspace_required = true,
			root_markers = { "package.json" },
		})

		vim.lsp.config("denols", {
			workspace_required = true,
			root_markers = { "deno.json", "deno.jsonc" },
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function()
				local bufmap = function(mode, lhs, rhs)
					local opts = { buffer = true }
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>") -- Displays hover information about the symbol under the cursor
				bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>") -- Jump to the definition
				bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>") -- Jump to declaration
				bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>") -- Lists all the implementations for the symbol under the cursor
				bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>") -- Jumps to the definition of the type symbol
				bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>") -- Lists all the references
				bufmap("n", "<Leader>k", "<cmd>lua vim.lsp.buf.signature_help()<cr>") -- Displays a function's signature information
				bufmap("n", "<Leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>") -- Renames all references to the symbol under the cursor
				bufmap("n", "<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>") -- Selects a code action available at the current cursor position
				bufmap("x", "<Leader>a", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")
				bufmap("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float()<cr>") -- Show diagnostics in a floating window
				bufmap("n", "<Leader>p", "<cmd>lua vim.diagnostic.goto_prev()<cr>") -- Move to the previous diagnostic
				bufmap("n", "<Leader>n", "<cmd>lua vim.diagnostic.goto_next()<cr>") -- Move to the next diagnostic
			end,
		})

		vim.diagnostic.config({
			-- virtual_text = false, -- Turn on/off inline diagnostics
			virtual_text = {
				prefix = "",
			},
			-- Change the Diagnostic symbols in the sign column (gutter)
			-- find symbols here: https://github.com/folke/trouble.nvim
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = " ",
				},
			},
		})

		-- filetype http
		vim.filetype.add({
			extension = {
				["http"] = "http",
			},
		})
	end,
}
