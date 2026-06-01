return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end
        map("]h", gs.next_hunk, "Next hunk")
        map("[h", gs.prev_hunk, "Prev hunk")
        map("<leader>hs", gs.stage_hunk, "Stage hunk")
        map("<leader>hr", gs.reset_hunk, "Reset hunk")
        map("<leader>hp", gs.preview_hunk, "Preview hunk")
      end,
    },
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview / merge tool" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current file)" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "File history (repo)" },
    },
    opts = {
      -- 3-way merge layout: OURS (your changes) | result | THEIRS (server)
      view = {
        merge_tool = {
          layout = "diff3_mixed",
          disable_diagnostics = true,
        },
      },
    },
  },
}
