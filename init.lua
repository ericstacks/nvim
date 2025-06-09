local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)
vim.api.nvim_create_autocmd("TabNewEntered", {
    callback = function()
        vim.cmd("Neotree show left")
    end,
})
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local arg = vim.fn.argv()[1]
        if arg and vim.fn.isdirectory(arg) == 1 then
            vim.cmd("Neotree show")
        end
    end,
})
-- Mantém a variável 'opts' para uso futuro
local opts = {}

-- Primeiro carrega os plugins
require("lazy").setup("plugins")
-- Depois configurações locais
--require("clipboard") -- only wsl
require("vim-options")
require("keymaps")
require("autocmds")
