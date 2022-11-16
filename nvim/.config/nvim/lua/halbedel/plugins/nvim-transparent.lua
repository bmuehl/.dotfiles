-- import nvim-transparent plugin safely
local setup, transparent = pcall(require, "transparent")
if not setup then
	return
end

-- setup nvim-transparent
transparent.setup({
	enable = true, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups

		-- akinsho/nvim-bufferline.lua
		"BufferLineFill",
		-- "BufferLineSeparator",
	},
	exclude = {}, -- table: groups you don't want to clear
})
