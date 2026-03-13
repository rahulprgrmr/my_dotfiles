-- local capabilities = require("config.lsp-capabilities").get()
--
local original_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

vim.lsp.config["*"] = {
	capabilities = capabilities,
}

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				-- library = {
				-- 	vim.env.VIMRUNTIME,
				-- 	vim.fn.stdpath("config"),
				-- 	vim.fn.stdpath("data"),
				-- },
				library = vim.api.nvim_get_runtime_file("", true),
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

vim.lsp.config("ruff", {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
})

local function get_poetry_python()
	-- Find nearest pyproject.toml upwards
	local pyproject = vim.fn.findfile("pyproject.toml", ".;")
	if pyproject == "" then
		return nil
	end

	local project_dir = vim.fn.fnamemodify(pyproject, ":h")

	-- Run poetry inside that directory
	local cmd = "cd " .. vim.fn.shellescape(project_dir) .. " && poetry env info -p 2>/dev/null"
	local handle = io.popen(cmd)
	if not handle then
		return nil
	end

	local result = handle:read("*a")
	handle:close()

	if result and result ~= "" then
		return vim.trim(result) .. "/bin/python"
	end

	return nil
end

vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				inlayHints = {
					variableTypes = true,
					functionReturnTypes = true,
					callArgumentNames = true,
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
				},
			},
		},
	},
	before_init = function(_, config)
		local python_path = get_poetry_python()
		if python_path then
			config.settings = config.settings or {}
			config.settings.python = config.settings.python or {}
			config.settings.python.pythonPath = python_path
		end
	end,
})
vim.lsp.config("bashls", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("gopls", {})
vim.lsp.config("clangd", {})

vim.lsp.enable({
	"lua_ls",
	"ruff",
	"pyright",
	"bashls",
	"ts_ls",
	"gopls",
	"clangd",
})

vim.pack.add({
	"https://github.com/mfussenegger/nvim-lint",
})

-- plugin setup
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy", -- or remove this autocmd and run immediately if you prefer
	callback = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "ruff" },
			html = { "djlint" },

			-- ⭐ Lua linting
			lua = { "selene" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
})
-- LSP keymaps on attach (modern pattern)
local function lsp_on_attach(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if not client then
		return
	end

	local bufnr = ev.buf
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gd", function()
		require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
	end, opts)

	vim.keymap.set("n", "gD", vim.lsp.buf.definition, opts)

	vim.keymap.set("n", "gs", function()
		vim.cmd("vsplit")
		vim.lsp.buf.definition()
	end, opts)

	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	vim.keymap.set("n", "<leader>D", function()
		vim.diagnostic.open_float({ scope = "line" })
	end, opts)

	vim.keymap.set("n", "<leader>d", function()
		vim.diagnostic.open_float({ scope = "cursor" })
	end, opts)

	vim.keymap.set("n", "<leader>nd", function()
		vim.diagnostic.jump({ count = 1 })
	end, opts)

	vim.keymap.set("n", "<leader>pd", function()
		vim.diagnostic.jump({ count = -1 })
	end, opts)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show documentation" }))

	vim.keymap.set("n", "<leader>fd", function()
		require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
	end, opts)
	vim.keymap.set("n", "<leader>fr", function()
		require("fzf-lua").lsp_references()
	end, opts)
	vim.keymap.set("n", "<leader>ft", function()
		require("fzf-lua").lsp_typedefs()
	end, opts)
	vim.keymap.set("n", "<leader>fs", function()
		require("fzf-lua").lsp_document_symbols()
	end, opts)
	vim.keymap.set("n", "<leader>fw", function()
		require("fzf-lua").lsp_workspace_symbols()
	end, opts)
	vim.keymap.set("n", "<leader>fi", function()
		require("fzf-lua").lsp_implementations()
	end, opts)

	vim.keymap.set("n", "<leader>h", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		vim.notify("Inlay hints " .. (vim.lsp.inlay_hint.is_enabled() and "enabled" or "disabled"))
	end, { desc = "Toggle inlay hints" })

	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))

	-- organize imports if supported
	if client:supports_method("textDocument/codeAction") then
		vim.keymap.set("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
				bufnr = bufnr,
			})
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50)
		end, opts)
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = lsp_on_attach,
})
