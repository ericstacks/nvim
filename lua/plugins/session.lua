return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_enabled = true,
      auto_save_enabled = true,
      
      auto_restore_enabled = false,
      auto_session_enable_last_session = false,
      -- ❌ remove ou comente a linha abaixo:
      -- auto_session_suppress_dirs = { "/", "~" },
    })
  end,
}
