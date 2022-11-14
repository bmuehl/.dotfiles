-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require('nvim-tree').setup()
require('gitsigns').setup()
require('lualine').setup {
  options = {
    theme = 'nord'
  }
}
require('leap').add_default_mappings()
require('nvim-treesitter.configs').setup {
	ensure_installed = "all",
	highlight = {
		enable = true
	}
}
