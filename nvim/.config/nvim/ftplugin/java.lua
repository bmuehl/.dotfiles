local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
	vim.notify("JDTLS not found, install with `:LspInstall jdtls`")
	return
end
vim.notify(vim.fn.stdpath("data"))

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name

local is_dir = function(path)
	local f = io.open(path, "r")
	if f == nil then
		return false
	end
	local _, _, code = f:read(1)
	f:close()
	return code == 21
end

if not is_dir(workspace_dir) then
	os.execute("mkdir " .. workspace_dir)
end

local jdtls_install = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local lombok = jdtls_install .. "/lombok.jar"
-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {

		-- 💀
		"java", -- or '/path/to/java17_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. lombok,
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- 💀
		"-jar",
		jdtls_install .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		-- Must point to the                                                     Change this to
		-- eclipse.jdt.ls installation                                           the actual version

		-- 💀
		"-configuration",
		jdtls_install .. "/config_mac",
		-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation            Depending on your system.

		-- 💀
		-- See `data directory configuration` section in the README
		"-data",
		workspace_dir,
	},

	-- 💀
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
			format = {
				settings = {
					url = "../utils/SIM.xml",
					profile = "SIM",
				},
			},
		},
	},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = {},
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
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
