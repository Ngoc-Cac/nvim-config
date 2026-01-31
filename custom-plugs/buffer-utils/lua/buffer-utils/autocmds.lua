local hist_tracker = require("buffer-utils.history-tracker")
local prev_closed_win = nil
local augrp = "BufExtendDel"
vim.api.nvim_create_augroup(augrp, {clear = true})

local function should_track(buf)
  local buf_opts = vim.bo[buf]
  return buf_opts.buflisted and buf_opts.modifiable
end

vim.api.nvim_create_autocmd("BufWinLeave", {
  group = augrp,
  desc = "Add the current buffer to the history tracker",
  callback = function(ev)
    local cur_buf, cur_win = ev.buf, vim.api.nvim_get_current_win()

    if cur_win ~= prev_closed_win and should_track(cur_buf) then
      hist_tracker.track_buf(cur_win, cur_buf)
    end
  end
})

vim.api.nvim_create_autocmd({ "BufDelete", "BufWipeout" }, {
  group = augrp,
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
  group = augrp,
  desc = "Remove the closed window from the history tracker",
  callback = function(ev)
    prev_closed_win = tonumber(ev.match)
    if prev_closed_win and hist_tracker.buffer_history[prev_closed_win] then
      hist_tracker.close_win(prev_closed_win)
    end
  end
})
