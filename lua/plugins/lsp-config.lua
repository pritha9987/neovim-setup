return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup( {
         ensure_installed = {
            "clangd",
            "clang-format",
          }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup( {
        ensure_installed = {"lua_ls"}
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ })
      lspconfig.clangd.setup({
          cmd = {"clangd", "--clang-tidy", "--offset-encoding=utf-16", },
          filetypes = {"c", "cpp"},
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
