set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a
set nocompatible

call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/nvim-tree/nvim-tree.lua' " NvimTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/shaunsingh/nord.nvim' "  Nord Theme
Plug 'https://github.com/nvim-lualine/lualine.nvim' " Status Bar
Plug 'https://github.com/lewis6991/gitsigns.nvim' " Git Lense
Plug 'https://github.com/airblade/vim-gitgutter' " Git Gutter
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/nvim-tree/nvim-web-devicons' " Web Dev Icons
Plug 'https://github.com/romgrk/barbar.nvim' " Buffer Tabs
Plug 'https://github.com/ggandor/leap.nvim' " Leap navigation
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax and indentation support

" LSP
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/williamboman/mason.nvim'
Plug 'https://github.com/williamboman/mason-lspconfig.nvim'
" Autocomplete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

set encoding=UTF-8

call plug#end()

" NvimTree
nnoremap <C-f> :NvimTreeFindFile<CR>

" BarBar
" Move to previous/next
nnoremap <silent>    <M-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <M-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <M-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <M->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <M-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <M-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <M-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <M-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <M-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <M-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <M-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <M-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <M-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <M-0> <Cmd>BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <M-p> <Cmd>BufferPin<CR>
" Close buffer
nnoremap <silent>    <M-c> <Cmd>BufferClose<CR>

" Git Signs
nnoremap <C-b> :Gitsigns toggle_current_line_blame<CR>


colorscheme nord


lua require('config')
