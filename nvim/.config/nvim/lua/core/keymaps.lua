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

-- neo-tree
keymap.set("n", "<leader>e", ":Neotree reveal<CR>", { noremap = true, silent = true }) -- file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- restart lsp server
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- gitsigns
keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>")
keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>")

-- bufferline
keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>") -- move to previous
keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>") -- move to next

-- nvim-bufdel
keymap.set("n", "<leader>cc", "<cmd>:BufDel<CR>", { noremap = true, silent = true }) -- delete current buffer
keymap.set("n", "<leader>co", "<cmd>:BufDelOthers<CR>", { noremap = true, silent = true }) -- delete other than current buffer
keymap.set("n", "<leader>ca", "<cmd>:BufDelAll<CR>", { noremap = true, silent = true }) -- delete all buffers
