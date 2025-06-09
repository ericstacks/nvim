return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        hijack_netrw_behavior = "disabled",
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        use_libuv_file_watcher = true,
      },
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
    })

    -- Atalhos para abrir/fechar
    vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal left<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>e", ":Neotree close<CR>", { noremap = true, silent = true })

    -- Comando personalizado :Cantaofs
    vim.api.nvim_create_user_command("Cantaofs", function()
      local path = "/newdrive/repos/s2holding/cantao/2024/cantaofs"
      if vim.fn.isdirectory(path) == 1 then
        vim.cmd("Neotree dir=" .. path)
      else
        vim.notify("Diretório '" .. path .. "' não existe!", vim.log.levels.ERROR)
      end
    end, {})

    -- Atualiza a tree com o arquivo atual sempre que muda de buffer
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        require("neo-tree.sources.manager").refresh("filesystem")
      end,
    })

    -- Centraliza na tree
    vim.keymap.set("n", "<leader>nf", ":Neotree reveal<CR>", { noremap = true, silent = true })

    -- Atalho para mudar o cwd para a pasta selecionada no Neo-tree
    vim.keymap.set("n", ".", function()
      local ok, state = pcall(require, "neo-tree.sources.manager")
      if not ok then
        print("❌ Erro ao carregar o estado do Neo-tree")
        return
      end

      local fs_state = state.get_state("filesystem")
      local node = fs_state.tree and fs_state.tree:get_node()

      if node and node.type == "directory" then
        vim.cmd("cd " .. vim.fn.fnameescape(node.path))
        print("📂 Entrou em: " .. node.path)
      else
        print("❌ Selecione uma pasta no Neo-tree.")
      end
    end, { desc = "Alterar cwd para a pasta selecionada no Neo-tree" })

    -- Atalho para subir um diretório (cd ..)
    vim.keymap.set("n", ",", function()
      local cwd = vim.fn.getcwd()
      local parent = vim.fn.fnamemodify(cwd, ":h")
      vim.cmd("cd " .. vim.fn.fnameescape(parent))
      print("⬆️ Subiu para: " .. parent)
    end, { desc = "Subir para o diretório pai (cd ..)" })
  end
}
