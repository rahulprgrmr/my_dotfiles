vim.pack.add({
	"https://github.com/stevearc/resession.nvim",
})

vim.cmd("packadd resession.nvim")

local resession = require("resession")

resession.setup({
	-- Options for automatically saving sessions on a timer
	autosave = {
		enabled = false,
		-- How often to save (in seconds)
		interval = 60,
		-- Notify when autosaved
		notify = true,
	},
	-- Save and restore these options
	options = {
		"binary",
		"bufhidden",
		"buflisted",
		"cmdheight",
		"diff",
		"filetype",
		"modifiable",
		"previewwindow",
		"readonly",
		"scrollbind",
		"winfixheight",
		"winfixwidth",
	},
	-- Custom logic for determining if the buffer should be included
	buf_filter = require("resession").default_buf_filter,
	-- Custom logic for determining if a buffer should be included in a tab-scoped session
	tab_buf_filter = function(tabpage, bufnr)
		return true
	end,
	-- The name of the directory to store sessions in
	dir = "session",
	-- Show more detail about the sessions when selecting one to load.
	-- Disable if it causes lag.
	load_detail = true,
	-- List order ["modification_time", "creation_time", "filename"]
	load_order = "modification_time",
	-- Configuration for extensions
	extensions = {
		quickfix = {},
	},
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Only load the session if nvim was started with no args and without reading from stdin
		if vim.fn.argc(-1) == 0 and not vim.g.using_stdin then
			-- Save these to a different directory, so our manual sessions don't get polluted
			resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
		end
	end,
	nested = true,
})
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
	end,
})
vim.api.nvim_create_autocmd("StdinReadPre", {
	callback = function()
		-- Store this for later
		vim.g.using_stdin = true
	end,
})

---------------------------------------------------------------------
-- ⭐ FIX: Re-trigger FileType so LSP attaches after session load
---------------------------------------------------------------------
vim.api.nvim_create_autocmd("User", {
	pattern = "ResessionLoadPost",
	callback = function()
		vim.schedule(function()
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_loaded(buf) then
					vim.api.nvim_exec_autocmds("FileType", {
						buffer = buf,
					})
				end
			end
		end)
	end,
})

-- Resession does NOTHING automagically, so we have to set up some keymaps
vim.keymap.set("n", "<leader>ss", resession.save)
vim.keymap.set("n", "<leader>sl", resession.load)
vim.keymap.set("n", "<leader>sd", resession.delete)
