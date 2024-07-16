return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local colors = require("catppuccin.palettes").get_palette("mocha")

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

		local function recording()
			local reg = vim.fn.reg_recording()
			if reg == "" then
				return ""
			end -- not recording
			return "recording @" .. reg
		end

		-- configure lualine with modified theme
		lualine.setup({
			sections = {
				lualine_x = {
					{
						recording,
						color = { fg = colors.pink },
					},
					"encoding",
					os_icon,
					"filetype",
				},
			},
			options = {
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
			},
		})
	end,
}
