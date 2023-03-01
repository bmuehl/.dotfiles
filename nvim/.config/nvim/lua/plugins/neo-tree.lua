-- import nvim-tree plugin safely
local setup, neotree = pcall(require, "neo-tree")
if not setup then
	return
end

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

neotree.setup({
	window = {
		auto_expand_width = true,
	},
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
		},
	},
})

-- define custom highlight groups
local status = pcall(require, "nord")
if not status then
	print("Colorscheme not found!")
	return
end
local named_colors = require("nord.named_colors")

-- not supported by nord theme yet
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = named_colors.teal })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = named_colors.teal })

vim.api.nvim_set_hl(0, "NeoTreeDimText", { fg = named_colors.light_gray_bright })
vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = named_colors.light_gray_bright })

vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = named_colors.yellow })
vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { fg = named_colors.orange })
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = named_colors.orange })
vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = named_colors.red })
vim.api.nvim_set_hl(0, "NeoTreeGitConflict", { fg = named_colors.red })

-- NeoTreeBufferNumber       The buffer number shown in the buffers source.
-- NeoTreeCursorLine         |hl-CursorLine| override in Neo-tree window.
-- NeoTreeDimText            Greyed out text used in various places.
-- NeoTreeDirectoryIcon      Directory icon.
-- NeoTreeDirectoryName      Directory name.
-- NeoTreeDotfile            Used for icons and names when dotfiles are filtered.
-- NeoTreeFileIcon           File icon, when not overridden by devicons.
-- NeoTreeFileName           File name, when not overwritten by another status.
-- NeoTreeFileNameOpened     File name when the file is open. Not used yet.
-- NeoTreeFilterTerm         The filter term, as displayed in the root node.
-- NeoTreeFloatBorder        The border for pop-up windows.
-- NeoTreeFloatTitle         Used for the title text of pop-ups when the border-style
--                           is set to another style than "NC". This is derived
--                           from NeoTreeFloatBorder.
-- NeoTreeTitleBar           Used for the title bar of pop-ups, when the border-style
--                           is set to "NC". This is derived from NeoTreeFloatBorder.
-- NeoTreeGitAdded           File name when the git status is added.
-- NeoTreeGitConflict        File name when the git status is conflict.
-- NeoTreeGitDeleted         File name when the git status is deleted.
-- NeoTreeGitIgnored         File name when the git status is ignored.
-- NeoTreeGitModified        File name when the git status is modified.
-- NeoTreeGitUnstaged        Used for git unstaged symbol.
-- NeoTreeGitUntracked       File name when the git status is untracked.
-- NeoTreeGitStaged          Used for git staged symbol.
-- NeoTreeHiddenByName       Used for icons and names when `hide_by_name` is used.
-- NeoTreeIndentMarker       The style of indentation markers (guides). By default,
--                           the "Normal" highlight is used.
-- NeoTreeExpander           Used for collapsed/expanded icons.
-- NeoTreeNormal             |hl-Normal| override in Neo-tree window.
-- NeoTreeNormalNC           |hl-NormalNC| override in Neo-tree window.
-- NeoTreeSignColumn         |hl-SignColumn| override in Neo-tree window.
-- NeoTreeStatusLine         |hl-StatusLine| override in Neo-tree window.
-- NeoTreeStatusLineNC       |hl-StatusLineNC| override in Neo-tree window.
-- NeoTreeVertSplit          |hl-VertSplit| override in Neo-tree window.
-- NeoTreeWinSeparator       |hl-WinSeparator| override in Neo-tree window.
-- NeoTreeEndOfBuffer        |hl-EndOfBuffer| override in Neo-tree window.
-- NeoTreeRootName           The name of the root node.
-- NeoTreeSymbolicLinkTarget Symbolic link target.
-- NeoTreeTitleBar           Used for the title bar of pop-ups, when the border-style
--                           is set to "NC". This is derived from NeoTreeFloatBorder.
-- NeoTreeWindowsHidden      Used for icons and names that are hidden on Windows.
