local hist_tracker = require("extended-buf-del.history-tracker")
local M = { history_tracker = hist_tracker }
local config = {
  switch_next = false,
  del_keymap = "<localleader>bd"
}

function M.buf_del()
  local cur_buf = vim.api.nvim_get_current_buf()
  local cur_win = vim.api.nvim_get_current_win()
  local history = hist_tracker.buffer_history[cur_win]

  if not history or #history == 0 then
    local win_closed = pcall(vim.api.nvim_win_close, cur_win, false)
    if win_closed then
      vim.api.nvim_buf_delete(cur_buf, { force = false })
    else
      vim.notify(
        "No next buffer to switch to!",
        vim.log.levels.INFO,
        { title = "No previous buffer!", timeout = 3000 }
      )
    end
    return
  else
    vim.api.nvim_set_current_buf(history[#history])
    vim.api.nvim_buf_delete(cur_buf, { force = false })
  end
end

function M.setup(opts)
  -- load the autocmds to track buffers
  require("extended-buf-del.autocmds")

  config = vim.tbl_deep_extend('force', config, opts or {})

  vim.keymap.set(
    "n", config.del_keymap, M.buf_del,
    { desc = "Delete the current buffer" }
  )
end

return M
