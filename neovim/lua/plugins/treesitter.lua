return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "javascript", "typescript", "tsx",
          "lua", "json", "html", "css",
          "markdown", "bash",
        },
        auto_install = true,
      })
    end,
  },
}
