local hist_tracker = require("buffer-utils.history-tracker")

local function buf_del()
  local cur_buf = vim.api.nvim_get_current_buf()
  local cur_win = vim.api.nvim_get_current_win()

  local history = hist_tracker.buffer_history[cur_win]
  if #history == 0 then
    local win_closed = pcall(vim.api.nvim_win_close, cur_win, false)
    if not win_closed then
      vim.notify(
        "No next buffer to switch to!",
        vim.log.levels.INFO,
        { title = "No previous buffer!", timeout = 3000 }
      )
    end
  else
    vim.api.nvim_set_current_buf(history[#history])
    table.remove(history)
  end

  vim.api.nvim_buf_delete(cur_buf, { force = false })
end

vim.api.nvim_create_augroup("BufExtendDel", {clear = true})
vim.api.nvim_create_autocmd("BufLeave", {
  group = "BufExtendDel",
  desc = "Add the current buffer to the history tracker",
  callback = function(ev)
    local cur_buf = ev.buf
    local buf_opts = vim.bo[cur_buf]
    if not buf_opts.buflisted or not buf_opts.modifiable then
      return
    end

    hist_tracker.track_buf(vim.api.nvim_get_current_win(), cur_buf)
  end
})

vim.api.nvim_create_autocmd({ "BufDelete", "BufWipeout" }, {
  group = "BufExtendDel",
  desc = "Delete the deleted buffer from history tracker",
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

vim.keymap.set("n", "<localleader>bd", buf_del, { desc = "Delete the current buffer." })
vim.api.nvim_create_user_command("R", function(opts)
  vim.cmd("e " .. opts.args .. " | bd#")
end, { nargs = 1, complete = "file" })

return {
  setup = function(_) end,
  del_cur_buf = buf_del,
  history_tracker = hist_tracker
}
