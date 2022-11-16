-- import bufferline plugin safely
local setup, bufferline = pcall(require, "bufferline")
if not setup then
	return
end

-- setup bufferline
bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = false,
			},
		},
	},
})
