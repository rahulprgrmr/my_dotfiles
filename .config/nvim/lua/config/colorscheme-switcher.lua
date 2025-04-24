-- local themes = { "gruvbox-material", "tokyonight", "catppuccin", "kanagawa" }
local themes = { "tokyonight" }
local current = 1

vim.keymap.set("n", "<leader>ct", function()
	current = current % #themes + 1
	vim.cmd("colorscheme " .. themes[current])
	print("Colorscheme: " .. themes[current])
end, { desc = "Cycle themes" })
