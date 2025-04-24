local opt = vim.opt
opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 4 -- Amount to indent with << and >>
opt.tabstop = 4 -- How many spaces are shown per Tab
opt.softtabstop = 4 -- How many spaces are applied when pressing Tab

opt.smarttab = true
opt.smartindent = true
opt.autoindent = true -- Keep indentation from previous line

-- Enable break indent
opt.breakindent = true

-- Always show relative line numbers
opt.number = true
opt.relativenumber = true

-- Show line under cursor
opt.cursorline = true

-- Store undos between sessions
opt.undofile = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

-- -- Enable true colors for the terminal
-- opt.termguicolors = true
--
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
-- vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
