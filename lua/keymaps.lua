-- Atalhos do modo insert
vim.keymap.set("i", "<C-k>", "<C-o>D", { noremap = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Listar buffers abertos" })
vim.keymap.set('v', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "LSP Code Action (Visual)" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "LSP Code Action" })

