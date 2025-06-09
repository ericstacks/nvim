-- lua/autocmds.lua
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.tsx", "*.lua", "*.json", "*.html", "*.css" },
  command = "silent! normal! gg=G",
})

