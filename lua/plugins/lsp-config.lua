return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "html",
          "eslint",
          "pyright",
          "jdtls",
          "ts_ls",
        },
        -- automatic_enable = true, -- já é o default
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- capabilities
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- aplica capabilities pra TODOS os LSPs
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- config específica pro HTML
      vim.lsp.config("html", {
        filetypes = { "html", "handlebars" },
      })

      -- se quiser forçar manualmente (não é obrigatório com mason-lspconfig v2):
      -- for _, server in ipairs({ "lua_ls", "html", "eslint", "pyright", "jdtls", "ts_ls" }) do
      --   vim.lsp.enable(server)
      -- end

      -- keymaps LSP
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to definition" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
    end,
  },
}
