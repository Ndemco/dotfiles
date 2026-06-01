return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "javascript", "typescript", "tsx",
          "lua", "json", "html", "css",
          "markdown", "markdown_inline", "bash",
          "go", "gomod", "gowork",
        },
        auto_install = true,
      })
    end,
  },
}
