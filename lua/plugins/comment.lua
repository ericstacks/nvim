return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    require("Comment").setup()

    -- Mapear <C-/> no modo insert para comentar a linha atual
    vim.keymap.set("i", "<C-/>", function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      vim.cmd("normal! gcc")
      vim.api.nvim_feedkeys("A", "n", false)
    end, { noremap = true, silent = true })
  end
}
