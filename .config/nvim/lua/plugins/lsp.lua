-- LSP + Mason lazy loader

vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

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

vim.cmd("packadd nvim-lspconfig")
require("config.lsp")
