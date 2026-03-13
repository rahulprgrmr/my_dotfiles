vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/refractalize/oil-git-status.nvim",
})

vim.keymap.set("n", "-", function()
  vim.cmd("packadd oil.nvim")
  vim.cmd("packadd oil-git-status.nvim")

  if not package.loaded["oil"] then
    require("oil").setup({
      view_options = { show_hidden = true },
      win_options = { signcolumn = "yes:2" },
    })

    require("oil-git-status").setup({ show_ignored = true })
  end

  vim.cmd("Oil --float --preview")
end, { desc = "Open Oil" })
