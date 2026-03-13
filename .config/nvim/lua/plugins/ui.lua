vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/neanias/everforest-nvim",
	"https://github.com/folke/noice.nvim",
	{ src = "https://github.com/stevearc/dressing.nvim", event = "VeryLazy" },
	"https://github.com/MunifTanjim/nui.nvim",
})

vim.cmd("packadd everforest-nvim")
vim.cmd.colorscheme("everforest")

vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		vim.cmd("packadd noice.nvim")
		vim.cmd("packadd dressing.nvim")

		require("dressing").setup({})
		require("noice").setup({
			presets = { long_message_to_split = true },
		})
	end,
})
