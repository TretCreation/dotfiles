return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
      --
      -- All of these are just the defaults
      --
      enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
      trigger_events = { -- See :h events
        immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
        defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
        cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
      },
      -- function that takes the buffer handle and determines whether to save the current buffer or not
      -- return true: if buffer is ok to be saved
      -- return false: if it's not ok to be saved
      -- if set to `nil` then no specific condition is applied
      condition = nil,
      write_all_buffers = false, -- write all buffers when the current one meets `condition`
      -- Do not execute autocmds when saving
      -- This is what fixed the issues with undo/redo that I had
      -- https://github.com/okuuva/auto-save.n...
      noautocmd = false,
      lockmarks = false, -- lock marks when saving, see `:h lockmarks` for more details
      -- delay after which a pending save is executed (default 1000)
      debounce_delay = 1000,
      debug = false, -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
    },
    config = function(_, opts)
      require("auto-save").setup(opts)

      -- Add the custom autocommand here
      local group = vim.api.nvim_create_augroup("autosave", {})
      vim.api.nvim_create_autocmd("User", {
        pattern = "AutoSaveWritePost",
        group = group,
        callback = function(opts)
          if opts.data.saved_buffer ~= nil then
            local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
            local msg = "AutoSave: saved " .. filename .. " at " .. vim.fn.strftime("%H:%M:%S")
            local notify_id = vim.notify(msg, vim.log.levels.INFO, { timeout = 500 }) -- 500ms timeout
          end
        end,
        -- 	config = function(_, opts)
        --   require("auto-save").setup(opts)

        --   -- Create the autocommand group
        --   local group = vim.api.nvim_create_augroup("autosave", {})
        --   vim.api.nvim_create_autocmd("User", {
        --     pattern = "AutoSaveWritePost",
        --     group = group,
        --     callback = nil, -- Remove notification logic
        --   })
        -- end,
      })
    end,
  },
}
