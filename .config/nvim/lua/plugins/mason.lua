vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", event = "VeryLazy" },
})

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
			"eslint_d",
			"djlint",
			"shellcheck",
		},
	})
end)
