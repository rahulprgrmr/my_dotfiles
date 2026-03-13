-- Install
vim.pack.add({
	"https://www.github.com/ibhagwan/fzf-lua",
})

---------------------------------------------------------------------
-- Lazy loader helper
---------------------------------------------------------------------
local loaded = false

local function load_fzf()
	if loaded then
		return
	end
	loaded = true

	vim.cmd("packadd fzf-lua")

	require("fzf-lua").setup({})
end

---------------------------------------------------------------------
-- Keymaps (lazy entry points)
---------------------------------------------------------------------
vim.keymap.set("n", "<leader>ff", function()
	load_fzf()
	require("fzf-lua").files({
		cmd = "fd --type f --hidden --follow --no-ignore --exclude .git",
	})
end, { desc = "FZF Files" })

vim.keymap.set("n", "<leader>fg", function()
	load_fzf()
	require("fzf-lua").live_grep()
end, { desc = "FZF Live Grep" })

vim.keymap.set("n", "<leader><leader>", function()
	load_fzf()
	require("fzf-lua").buffers()
end, { desc = "FZF Buffers" })

vim.keymap.set("n", "<leader>fc", function()
	load_fzf()
	require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find in Neovim Config" })

vim.keymap.set("n", "<leader>fh", function()
	load_fzf()
	require("fzf-lua").help_tags()
end, { desc = "FZF Help Tags" })

vim.keymap.set("n", "<leader>fx", function()
	load_fzf()
	require("fzf-lua").diagnostics_document()
end, { desc = "FZF Diagnostics Document" })

vim.keymap.set("n", "<leader>fX", function()
	load_fzf()
	require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF Diagnostics Workspace" })
