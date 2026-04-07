return {
	"tpope/vim-surround", -- add, delete, change surroundings ysw)
	"vim-scripts/ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
	"terryma/vim-multiple-cursors", -- multiple cursors with CTRL + N
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {},
	},
	"windwp/nvim-ts-autotag", -- autoclose tags
	"mfussenegger/nvim-jdtls", -- java lsp
	"christoomey/vim-tmux-navigator", -- navigate between vim and tmux panes
	"editorconfig/editorconfig-vim", -- editorconfig
	"jidn/vim-dbml", -- dbml
}
