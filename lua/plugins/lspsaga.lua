return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({
            ui = {
                border = "rounded",
                code_action = "💡",
            },
            lightbulb = {
                enable = true,
                enable_in_insert = false,
                sign = true,
                virtual_text = true,
            },
            symbol_in_winbar = {
                enable = false,
            },
            rename = {
                in_select = false,
            },
            finder = {
                keys = {
                    shuttle = "<Tab>",
                    toggle_or_open = "<CR>",
                },
            },
        })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
}
