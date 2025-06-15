return {
	"gorbit99/codewindow.nvim",
	event = "BufReadPre", -- or lazy load with keybinding
	config = function()
		local codewindow = require("codewindow")

		codewindow.setup({
			auto_enable = false, -- Don't show by default
			use_lsp = true, -- Enable LSP diagnostics in minimap

			signs = {
				error = { color = "#FF0000", text = "█" },
				warn = { color = "#FFA500", text = "█" },
				info = { color = "#00FFFF", text = "█" },
				hint = { color = "#00FF00", text = "█" },
				other = { color = "#FFFFFF", text = "▒" },
			},

			exclude_filetypes = { "NvimTree", "TelescopePrompt", "alpha" },
		})

		-- Optional: bind some keys
		codewindow.apply_default_keybinds()
	end,
}
