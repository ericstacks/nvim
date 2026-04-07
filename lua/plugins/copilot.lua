return {
  -- Plugin principal
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",          -- carrega sob demanda
    event = "InsertEnter",    -- ou "VeryLazy"
    config = function()
      local suggestion = require("copilot.suggestion")

      require("copilot").setup({
        panel = { enabled = false }, -- painel flutuante opcional
        suggestion = {
          auto_trigger = true,
          keymap = {
            next   = "<M-]>",   -- próxima
            prev   = "<M-[>",   -- anterior
            dismiss= "<C-x>",   -- descarta
          },
        },
      })

      vim.keymap.set("i", "<Tab>", function()
        if vim.fn.pumvisible() == 1 then
          return "<C-n>"
        end

        if suggestion.is_visible() then
          suggestion.accept()
          return ""
        end

        return "<Tab>"
      end, { expr = true, silent = true, replace_keycodes = false, desc = "Aceita Copilot ou avanca no menu" })

      vim.keymap.set("i", "<S-Tab>", function()
        if vim.fn.pumvisible() == 1 then
          return "<C-p>"
        end

        return "<S-Tab>"
      end, { expr = true, silent = true, replace_keycodes = false, desc = "Volta no menu de completions" })
    end,
  },

  -- (opcional) integração com nvim-cmp
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   dependencies = { "zbirenbaum/copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
}
