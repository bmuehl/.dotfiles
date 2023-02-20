-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

----------------------
-- Remaps
----------------------

-- move selected text in visual mode with J and K
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle when navigation up and down
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
-- for searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- paste without replacing current paste buffer
keymap.set("x", "<leader>p", '"_dP')

----------------------
-- Plugin Keybinds
----------------------

-- nvim-tree
keymap.set("n", "<C-f>", ":NvimTreeFindFile<CR>") -- file explorer
keymap.set("n", "<leader><C-f>", ":NvimTreeToggle<CR>") -- file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- gitsigns
keymap.set("n", "<leader>bla", ":Gitsigns toggle_current_line_blame<CR>")
keymap.set("n", "<leader>dif", ":Gitsigns diffthis<CR>")

-- barbar
keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>") -- move to previous
keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>") -- move to next
keymap.set("n", "<leader>b", "<cmd>BufferLinePick<CR>") -- go to buffer x
keymap.set("n", "<leader>B", "<cmd>BufferLinePickClose<CR>") -- close buffer x
keymap.set("n", "<C-h>", "<cmd>BufferLineCloseLeft<CR>") -- close buffer on the left
keymap.set("n", "<C-l>", "<cmd>BufferLineCloseRight<CR>") -- close buffer on the right

-- lazygit
keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>")
