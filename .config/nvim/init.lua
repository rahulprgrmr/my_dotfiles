vim.loader.enable()

-- Disable inbuilt netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.statusline")
require("config.diagnostics")
require("config.terminal")


-- plugins AFTER core
require("plugins")
