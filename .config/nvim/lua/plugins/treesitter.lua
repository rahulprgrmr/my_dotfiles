-- vim.pack.add({
--   {
--     src = "https://github.com/nvim-treesitter/nvim-treesitter",
--     branch = "main",
--     build = ":TSUpdate",
--     event = "BufReadPost",
--   },
-- })
--
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   once = true,
--   callback = function()
--     -- vim.cmd("packadd nvim-treesitter")
--
--     require("nvim-treesitter.configs").setup({
--       auto_install = true,
--       highlight = { enable = true },
--     })
--
--     -- enable foldexpr AFTER load
--     vim.opt.foldmethod = "expr"
--     vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--   end,
-- })

vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",

		-- 🔥 THIS is the lazy trigger
		event = { "BufReadPost", "BufNewFile" },

		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					-- Shell
					"bash",

					-- Web (core)
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",

					-- Backend / scripting
					"python",
					"json",
					"yaml",
					"toml",

					-- DevOps / configs
					"dockerfile",
					"gitignore",
					"regex",

					-- Markdown & docs
					"markdown",
					"markdown_inline",

					-- Query / data
					"sql",

					-- Vim / Lua (important for nvim config)
					"lua",
					"vim",
					"vimdoc",

					-- Optional but useful
					"diff",
					"comment",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})

			-- enable folding after TS loads
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		end,
	},
})
