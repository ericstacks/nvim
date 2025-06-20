return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        require("ts_context_commentstring").setup {}
        vim.g.skip_ts_context_commentstring_module = true

        require("Comment").setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })

        vim.keymap.set("i", "<C-/>", function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
            vim.cmd("normal! gcc")
            vim.api.nvim_feedkeys("A", "n", false)
        end, { noremap = true, silent = true })
    end
}

