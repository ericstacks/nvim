return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob", "!.git/*",
                        "--glob", "!node_modules/*",
                        "--glob", "!build/*",
                        "--glob", "!dist/*",
                    },
                    file_ignore_patterns = { "%.git/", "node_modules", "build", "dist" },
                    mappings = {
                        i = {
                            ["<Esc>"] = actions.close,
                        },
                        n = {
                            ["q"] = actions.close,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    },
                },
            })

            telescope.load_extension("ui-select")

            -- Atalhos
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

            -- sudo pacman -S ripgrep
            -- ESC tb funciona
            vim.keymap.set("n", "<C-[>", builtin.live_grep, { desc = "[Telescope] Live Grep" })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    }
}

