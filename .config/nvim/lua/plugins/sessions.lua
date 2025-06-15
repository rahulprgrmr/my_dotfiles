return {
	"rmagatti/auto-session",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	lazy = false,
	config = function()
		require("auto-session").setup({
			session_lens = {
				load_on_setup = true, -- Initialize on startup (requires Telescope)
				theme_conf = { -- Pass through for Telescope theme options
					-- layout_config = { -- As one example, can change width/height of picker
					--   width = 0.8,    -- percent of window
					--   height = 0.5,
					-- },
				},
				previewer = false, -- File preview for session picker
			},
			vim.keymap.set(
				"n",
				"<leader>ss",
				require("auto-session.session-lens").search_session,
				{ noremap = true, desc = "Search session" }
			),
		})
	end,
}
