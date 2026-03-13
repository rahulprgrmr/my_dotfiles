vim.pack.add({
  "https://github.com/stevearc/aerial.nvim",
})

-- Lazy load on demand
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    vim.cmd("packadd aerial.nvim")

    require("aerial").setup({
      -- backend priority (fastest first)
      backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

      layout = {
        min_width = 28,
        max_width = 40,
        default_direction = "right",
        resize_to_content = true,
      },

      attach_mode = "global",

      show_guides = true,
      filter_kind = false,

      highlight_mode = "split_width",

      guide_char = "│",
      float = {
        border = "rounded",
      },
    })
    -- Aerial
    vim.keymap.set("n", "<leader>o", function()
      require("aerial").toggle()
    end, { desc = "Toggle outline" })

    vim.keymap.set("n", "]s", function()
      require("aerial").next()
    end, { desc = "Next symbol" })

    vim.keymap.set("n", "[s", function()
      require("aerial").prev()
    end, { desc = "Prev symbol" })
  end,
})
