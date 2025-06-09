return {
  -- Plugin principal
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",          -- carrega sob demanda
    event = "InsertEnter",    -- ou "VeryLazy"
    config = function()
      require("copilot").setup({
        panel = { enabled = false }, -- painel flutuante opcional
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-l>",   -- aceita sugestão
            next   = "<C-.>",   -- próxima
            prev   = "<C-,>",   -- anterior
            dismiss= "<C-/>",   -- descarta
          },
        },
      })
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
