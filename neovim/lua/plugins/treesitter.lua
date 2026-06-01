return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      -- Map JSX/TSX filetypes to their parsers.
      vim.treesitter.language.register("tsx", "typescriptreact")
      vim.treesitter.language.register("javascript", "javascriptreact")

      local parsers = {
        "javascript", "typescript", "tsx",
        "lua", "json", "html", "css",
        "markdown", "markdown_inline", "bash",
        "go", "gomod", "gowork",
      }

      -- Install missing parsers (async; safe to re-run).
      require("nvim-treesitter").install(parsers)

      -- Enable tree-sitter highlighting per buffer. On the `main` branch this
      -- is NOT automatic — you must call vim.treesitter.start().
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "javascript", "javascriptreact",
          "typescript", "typescriptreact",
          "lua", "json", "html", "css",
          "markdown", "bash", "sh",
          "go", "gomod", "gowork",
        },
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
