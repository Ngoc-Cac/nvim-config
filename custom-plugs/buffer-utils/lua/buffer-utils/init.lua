local hist_tracker = require("buffer-utils.history-tracker")
local M = { history_tracker = hist_tracker }

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

vim.api.nvim_create_augroup("BufExtendDel", {clear = true})
vim.api.nvim_create_autocmd("BufLeave", {
  group = "BufExtendDel",
  desc = "Add the current buffer to the history tracker",
  callback = function(ev)
    local cur_buf = ev.buf
    local cur_win = vim.api.nvim_get_current_win()
    local buf_opts = vim.bo[cur_buf]

    if not buf_opts.buflisted or not buf_opts.modifiable then
      return
    elseif not hist_tracker.buffer_history[cur_win] then
      -- vs and sp commands re-use the current buffer and switch to new buffer
      -- we only want to track the new buffer, so skip this one. 
      hist_tracker.buffer_history[cur_win] = {}
      return
    end

    hist_tracker.track_buf(vim.api.nvim_get_current_win(), cur_buf)
  end
})

vim.api.nvim_create_autocmd({ "BufDelete", "BufWipeout" }, {
  group = "BufExtendDel",
  desc = "Delete the deleted buffer from the history tracker",
  callback = function(ev)
    hist_tracker.untrack_buf(ev.buf)

    -- remove the current buffer from the history of the current window
    local cur_buf = vim.api.nvim_get_current_buf()
    local history = hist_tracker.buffer_history[vim.api.nvim_get_current_win()]
    if history and history[#history] == cur_buf then
      table.remove(history)
    end
  end
})

vim.api.nvim_create_autocmd("WinClosed", {
  group = "BufExtendDel",
  desc = "Remove the closd window from the history tracker",
  callback = function(ev) hist_tracker.close_win(tonumber(ev.match)) end
})

function M.setup()
  vim.keymap.set("n", "<localleader>bd", M.buf_del, { desc = "Delete the current buffer." })
  vim.api.nvim_create_user_command("R", function(opts)
    vim.cmd("e " .. opts.args .. " | bd#")
  end, { nargs = 1, complete = "file" })
end

return M
