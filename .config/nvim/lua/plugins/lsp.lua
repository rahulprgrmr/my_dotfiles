-- LSP + Mason lazy loader

vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

---------------------------------------------------------------------
-- Mason: safe to load slightly deferred (lightweight but not free)
---------------------------------------------------------------------
vim.schedule(function()
	vim.cmd("packadd mason.nvim")
	vim.cmd("packadd mason-tool-installer.nvim")

	require("mason").setup({})

	require("mason-tool-installer").setup({
		ensure_installed = {
			"lua-language-server",
			"ruff",
			"pyright",
			"gopls",
			"clangd",
			"bash-language-server",
			"selene",
			"stylua",
			"json-lsp",
			"shfmt",
		},
	})
end)

---------------------------------------------------------------------
-- LSP: lazy load on first real buffer
---------------------------------------------------------------------
vim.api.nvim_create_autocmd("BufReadPre", {
	once = true,
	callback = function()
		vim.cmd("packadd nvim-lspconfig")

		-- load your actual LSP configs
		require("config.lsp")
	end,
})
