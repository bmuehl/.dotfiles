-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local function os_icon()
	local icons = {
		unix = "", -- e712
		dos = "", -- e70f
		mac = "", -- e711
	}
	if vim.fn.has("mac") == 1 then
		return icons.mac
	elseif vim.fn.has("win32") == 1 then
		return icons.dos
	else
		return icons.unix
	end
end

-- configure lualine with modified theme
lualine.setup({
	sections = {
		lualine_x = { "encoding", os_icon, "filetype" },
	},
})
