
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.formatoptions:append("cro")

vim.opt.title = true
vim.opt.titlestring = "%<%F - nvim"
vim.opt.guifont = "Maple Mono Medium:h14.5"
vim.cmd("filetype plugin indent on")

-- Treesitter folding padrão
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldcolumn = "1"

-- Autocmd para reforçar folding no filetype correto
vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescriptreact",
    callback = function()
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldenable = true
        vim.wo.foldlevel = 99
        vim.wo.foldcolumn = "1"
    end,
})
