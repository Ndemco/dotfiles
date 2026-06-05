return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "eslint", "gopls" },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({ capabilities = capabilities })
          end,
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
        end,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
          end
          -- Remove nvim 0.11 default gr* mappings so `gr` doesn't wait on timeoutlen.
          for _, k in ipairs({ "grr", "grn", "gra", "gri" }) do
            pcall(vim.keymap.del, "n", k, { buffer = event.buf })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gr", "<cmd>FzfLua lsp_references<cr>", "Go to references")
          map("K", vim.lsp.buf.hover, "Hover docs")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>d", vim.diagnostic.open_float, "Show diagnostics")
        end,
      })
    end,
  },
}
