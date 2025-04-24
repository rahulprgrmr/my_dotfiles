return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"blade",
				"c",
				"c_sharp",
				"comment",
				"cpp",
				"css",
				"csv",
				"dockerfile",
				"editorconfig",
				"git_config",
				"gitignore",
				"go",
				"graphql",
				"html",
				"htmldjango",
				"ini",
				"javascript",
				"json",
				"json5",
				"lua",
				"nginx",
				"php",
				"prisma",
				"python",
				"regex",
				"requirements",
				"rust",
				"scss",
				"sql",
				"ssh_config",
				"tsx",
				"typescript",
				"vim",
				"vue",
				"xml",
				"yaml",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<Enter>", -- set to `false` to disable one of the mappings
					node_incremental = "<Enter>",
					scope_incremental = false,
					node_decremental = "<Backspace>",
				},
			},
		})
	end,
}
