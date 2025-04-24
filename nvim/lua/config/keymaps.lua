local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "-", "<cmd>Oil --float --preview<CR>", { desc = "Open Parent Directory in Oil" })
keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })

-- Select all
keymap.set("n", "<C-a>", "ggVG")

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<tab>", "<cmd>:tabnext<CR>", opts) --  go to next tab
keymap.set("n", "<s-tab>", "<cmd>:tabprev<Return>", opts) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Diagnostics
--[[ keymap.set("n", "<C-J>", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, opts) ]]

-- Save
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<CR>", { desc = "Save File" })

-- Move current line up and down
-- Normal Mode
keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Mode
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
