local is_transparent = true
return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = true,
				transparent = is_transparent,
			})
			-- vim.cmd("colorscheme kanagawa")
		end,
		build = ":KanagawaCompile",
	},
	{
		"f4z3r/gruvbox-material.nvim",
		lazy = false,
		priority = 1000,
		cond = false,
		config = function()
			local search_flip_search_opts = nil
			local search_flip_inc_search_opts = nil
			local search_flip_flipped = false

			require("gruvbox-material").setup({
				constrast = "hard",

				background = {
					transparent = is_transparent,
				},
				customize = function(group, opts)
					local colors = require("gruvbox-material.colors").get(vim.o.background, "hard")
					-- print(vim.inspect(colors))

					if group == "CursorLineNr" then
						opts.link = nil
						opts.fg = colors.orange
						opts.bold = true
						return opts
					end

					-- Paren Matches should be orange without background
					if group == "MatchParen" or group == "MatchParenCur" or group == "MatchWord" then
						opts.link = nil
						opts.fg = colors.orange
						opts.bg = nil
						opts.bold = true
						return opts
					end

					-- Change background for completion and hover popups
					if
						group == "Pmenu"
						or group == "PmenuExtra"
						or group == "PmenuThumb"
						or group == "PmenuSbar"
						or group == "PmenuKind"
						or group == "NormalFloat"
					then
						opts.bg = colors.bg3
					end

					-- Change completion selection line
					if group == "PmenuSel" then
						opts.bg = colors.yellow
						-- opts.fg = colors.bg0
					end

					-- Change partial cmp matches
					if group == "CmpItemAbbrMatch" or group == "CmpItemAbbrMatchFuzzy" then
						opts.fg = colors.orange
					end

					-- Set search and incsearch to more appropriate colors
					if group == "Search" then
						opts.bg = colors.aqua
					end
					if group == "IncSearch" then
						opts.bg = colors.orange
					end

					return opts
				end,
			})
			-- TODO: The light theme needs work
			-- AUTO CHANGE MARKER: LIGHT/DARK
			vim.opt.background = "dark"
			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		enabled = false,
		opts = { transparent_background = is_transparent },
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		enabled = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup()
			-- vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				styles = {
					-- transparency = true,
				},
			})
			-- vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				-- Your config here
			})
			vim.cmd("colorscheme everforest")
		end,
	},
}
