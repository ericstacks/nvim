return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "tsx",
                "typescript",
                "javascript",
                "lua",
                "json",
                "html",
                "css"
            },
            -- 🔴 Remova qualquer uso antigo de context_commentstring aqui!
        })
    end,
}

