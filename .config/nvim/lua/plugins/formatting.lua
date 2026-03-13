vim.pack.add({
  {
    src = "https://github.com/stevearc/conform.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
  },
})

vim.cmd("packadd conform.nvim")


require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    sh = { "shfmt" },
    go = { "gofumpt" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },
  format_on_save = false,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function(args)
--     vim.cmd("packadd conform.nvim")
--
--     if not package.loaded["conform"] then
--       require("config.conform")
--     end
--
--     require("conform").format({
--       bufnr = args.buf,
--       timeout_ms = 2000,
--       lsp_fallback = true,
--     })
--   end,
-- })

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    local ok, conform = pcall(require, "conform")
    if not ok then
      return
    end

    conform.format({
      bufnr = args.buf,
      timeout_ms = 2000,
      lsp_fallback = true,
    })
  end,
})
