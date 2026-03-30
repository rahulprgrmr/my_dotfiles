vim.pack.add({
	{
		src = "https://www.github.com/lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
})

require("ibl").setup()
