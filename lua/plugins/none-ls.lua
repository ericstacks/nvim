return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim", -- traz eslint_d de volta
        },

        config = function()
            local null_ls = require("null-ls")

            local fmt = null_ls.builtins.formatting

            null_ls.setup({
                on_attach = function(_, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end,

                sources = {
                    -- Lua
                    fmt.stylua,

                    -- JS / TS / etc.
                    fmt.prettier.with({ prefer_local = "node_modules/.bin" }),

                    -- Python
                    fmt.black,
                    fmt.isort,

                    -- ESLint - agora vindos **do pacote extras**
                    require("none-ls.diagnostics.eslint_d"),
                    require("none-ls.code_actions.eslint_d"),
                },
            })

            vim.keymap.set("n", "<leader>gf",
                function() vim.lsp.buf.format({ async = true }) end,
                { desc = "Formatar buffer (none-ls)" })
        end,
    },
}
