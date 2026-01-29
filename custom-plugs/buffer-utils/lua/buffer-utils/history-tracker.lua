local M = {
  buffer_history = {}
}

local function delete_buf(hist, buf)
  for i, buffer in ipairs(hist) do
    if buf == buffer then
      table.remove(hist, i)
      break
    end
  end
end

function M.track_buf(win, buf)
  if not M.buffer_history[win] then
    M.buffer_history[win] = {}
  end

  local win_hist = M.buffer_history[win]

  delete_buf(win_hist, buf)

  table.insert(win_hist, buf)
  -- NOTE: maybe limit the history length 
end

function M.untrack_buf(buf)
  for _, history in pairs(M.buffer_history) do
    delete_buf(history, buf)
  end
end

function M.close_win(win)
  M.buffer_history[win] = nil
end

return M
