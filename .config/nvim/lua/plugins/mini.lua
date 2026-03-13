-- Install plugin
vim.pack.add({
  "https://www.github.com/echasnovski/mini.nvim",
})

-- Lazy-load after startup settles
vim.schedule(function()
  vim.cmd("packadd mini.nvim")

  -- Guard against double setup
  if package.loaded["mini.ai"] then
    return
  end

  require("mini.ai").setup({})
  require("mini.comment").setup({})
  require("mini.move").setup({})
  require("mini.surround").setup({})
  require("mini.cursorword").setup({})
  require("mini.indentscope").setup({})
  require("mini.pairs").setup({})
  require("mini.trailspace").setup({})
  require("mini.bufremove").setup({})
  require("mini.notify").setup({})
  require("mini.icons").setup({})
end)
