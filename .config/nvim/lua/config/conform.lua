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
