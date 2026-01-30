local hist_tracker = require("buffer-utils.history-tracker")
local prev_closed_win = nil
local M = { history_tracker = hist_tracker }

local function should_track(buf)
  local buf_opts = vim.bo[buf]
  return not buf_opts.buflisted or not buf_opts.modifiable
end

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
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = "BufExtendDel",
  desc = "Add the current buffer to the history tracker",
  callback = function(ev)
    local cur_buf, cur_win = ev.buf, vim.api.nvim_get_current_win()

    if cur_win ~= prev_closed_win and should_track(cur_buf) then
      hist_tracker.track_buf(cur_win, cur_buf)
    end
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
  callback = function(ev)
    prev_closed_win = tonumber(ev.match)
    hist_tracker.close_win(prev_closed_win)
  end
})

function M.setup()
  vim.keymap.set("n", "<localleader>bd", M.buf_del, { desc = "Delete the current buffer." })
  vim.api.nvim_create_user_command("R", function(opts)
    vim.cmd("e " .. opts.args .. " | bd#")
  end, { nargs = 1, complete = "file" })
end

return M
