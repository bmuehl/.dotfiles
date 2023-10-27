return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		-- auto setup mason lsp
		mason_lspconfig.setup_handlers({
			function(server_name) -- default handler (optional)
				lspconfig[server_name].setup({})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
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
			end,
			["emmet_ls"] = function()
				lspconfig["emmet_ls"].setup({
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
			end,
			["eslint"] = function()
				lspconfig["eslint"].setup({
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
						"vue",
						"astro",
					},
				})
			end,
			["jdtls"] = function() end, -- jdtls is configured in ftplugin/java.lua,
			["volar"] = function()
				lspconfig["volar"].setup({
					filetypes = { "vue" },
					init_options = {
						typescript = {
							tsdk =
							"/Users/bernhard.muehl/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib", -- fix volar error
						},
					},
				})
			end,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function()
				local bufmap = function(mode, lhs, rhs)
					local opts = { buffer = true }
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")          -- Displays hover information about the symbol under the cursor
				bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")    -- Jump to the definition
				bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")   -- Jump to declaration
				bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>") -- Lists all the implementations for the symbol under the cursor
				bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>") -- Jumps to the definition of the type symbol
				bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")    -- Lists all the references
				bufmap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>") -- Displays a function's signature information
				bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")      -- Renames all references to the symbol under the cursor
				bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>") -- Selects a code action available at the current cursor position
				bufmap("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")
				bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>") -- Show diagnostics in a floating window
				bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")  -- Move to the previous diagnostic
				bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")  -- Move to the next diagnostic
			end,
		})

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			virtual_text = true, -- Turn on/off inline diagnostics
		})

		-- Show all diagnostics on current line in floating window
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>d",
			":lua vim.diagnostic.open_float()<CR>",
			{ noremap = true, silent = true }
		)
		-- Go to next diagnostic (if there are multiple on the same line, only shows
		-- one at a time in the floating window)
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>n",
			":lua vim.diagnostic.goto_next()<CR>",
			{ noremap = true, silent = true }
		)
		-- Go to prev diagnostic (if there are multiple on the same line, only shows
		-- one at a time in the floating window)
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>p",
			":lua vim.diagnostic.goto_prev()<CR>",
			{ noremap = true, silent = true }
		)
		-- Format current buffer
		vim.api.nvim_set_keymap("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
	end,
}
