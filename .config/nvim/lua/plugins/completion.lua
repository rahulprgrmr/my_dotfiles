vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
		-- event = "InsertEnter",
	},
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/supermaven-inc/supermaven-nvim",
})

-- vim.api.nvim_create_autocmd("InsertEnter", {
--   once = true,
--   callback = function()
--     -- load completion stack
--     vim.cmd("packadd blink.cmp")
--     vim.cmd("packadd LuaSnip")
--
--     -- minimal luasnip config (fast)
--     require("luasnip").config.setup({
--       history = true,
--       updateevents = "TextChanged,TextChangedI",
--     })
--
--     -- blink setup
--     require("blink.cmp").setup({
--       signature = { enabled = true },
--       keymap = {
--         preset = "none",
--         ["<C-Space>"] = { "show", "hide" },
--         ["<CR>"] = { "accept", "fallback" },
--         ["<C-j>"] = { "select_next", "fallback" },
--         ["<C-k>"] = { "select_prev", "fallback" },
--         ["<Tab>"] = { "snippet_forward", "fallback" },
--         ["<S-Tab>"] = { "snippet_backward", "fallback" },
--       },
--       appearance = { nerd_font_variant = "mono" },
--       completion = {
--         documentation = { auto_show = true, auto_show_delay_ms = 500 },
--         menu = {
--           auto_show = true,
--           draw = {
--             treesitter = { "lsp" },
--             columns = {
--               { "kind_icon", "label", "label_description", gap = 1 },
--               { "kind" },
--             },
--           },
--         },
--       },
--       sources = { default = { "lsp", "path", "buffer", "snippets" } },
--       snippets = {
--         expand = function(snippet)
--           require("luasnip").lsp_expand(snippet)
--         end,
--       },
--       fuzzy = {
--         implementation = "prefer_rust",
--         prebuilt_binaries = { download = true },
--       },
--     })
--
--     -- lazy load snippets (IMPORTANT)
--     require("luasnip.loaders.from_vscode").lazy_load()
--
--     -- defer supermaven (smoother UX)
--     vim.defer_fn(function()
--       vim.cmd("packadd supermaven-nvim")
--       require("supermaven-nvim").setup({
--         keymaps = { accept_suggestion = "<C-n>" },
--       })
--     end, 100)
--   end,
-- })

-- load completion stack
vim.cmd("packadd blink.cmp")
vim.cmd("packadd LuaSnip")

-- minimal luasnip config (fast)
require("luasnip").config.setup({
	history = true,
	updateevents = "TextChanged,TextChangedI",
})

-- blink setup
require("blink.cmp").setup({
	signature = { enabled = true },
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = {
					{ "kind_icon", "label", "label_description", gap = 1 },
					{ "kind" },
				},
			},
		},
		list = {
			selection = {
				preselect = false,
				auto_insert = false,
			},
		},
	},
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},
	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = { download = true },
	},
})

-- lazy load snippets (IMPORTANT)
require("luasnip.loaders.from_vscode").lazy_load()

-- defer supermaven (smoother UX)
vim.defer_fn(function()
	vim.cmd("packadd supermaven-nvim")
	require("supermaven-nvim").setup({
		keymaps = { accept_suggestion = "<C-n>" },
	})
end, 100)
