return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

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
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
			},
		})
	end,
}
