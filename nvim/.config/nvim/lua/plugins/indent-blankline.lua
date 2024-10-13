return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		scope = {
			char = "▎",
			enabled = true,
		},
		indent = {
			char = "▏",
			repeat_linebreak = false,
		},
	},
}
