return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
				theme = "doom",
				config = {
					header = {
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                     ]],
						[[       ████ ██████           █████      ██                     ]],
						[[      ███████████             █████                             ]],
						[[      █████████ ███████████████████ ███   ███████████   ]],
						[[     █████████  ███    █████████████ █████ ██████████████   ]],
						[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
						[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
						[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
						[[                                                                       ]],
						[[                                                                       ]],
						[[                                                                       ]],
					},
					center = {
						{
							icon = "  ",
							desc = "Find file",
							key = "f",
							action = 'lua require("fzf-lua").files()',
						},
						{
							icon = "  ",
							desc = "Live grep",
							key = "g",
							action = 'lua require("fzf-lua").live_grep()',
						},
						{
							icon = "  ",
							desc = "Recent files",
							key = "r",
							action = 'lua require("fzf-lua").oldfiles()',
						},
						{
							icon = "  ",
							desc = "Find in Neovim config",
							key = "c",
							action = 'lua require("fzf-lua").files({cwd=vim.fn.stdpath("config")})',
						},
						{
							icon = "⏻  ",
							desc = "Quit Neovim",
							key = "q",
							action = "qa",
						},
					},
					footer = {
						"⚡ Powered by Neovim + fzf-lua",
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		cond = false,
		dependencies = { "echasnovski/mini.icons" },

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.startify")

			dashboard.section.header.val = {
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                       ]],
			}

			-- Set menu
			dashboard.section.top_buttons.val = {
				dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
				dashboard.button("-", "  > Toggle file explorer", "<cmd>Oil --float<CR>"),
				dashboard.button("SPC ff", "󰱼  > Find File", function()
					require("fzf-lua").files()
				end),
				dashboard.button("SPC fs", "  > Find Word", function()
					require("fzf-lua").live_grep()
				end),
				dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
				dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
			}

			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		end,
	},
}
