local function backspace_del()
  local col = vim.fn.col(".")
  local before_cur = vim.api.nvim_get_current_line():sub(1, col - 1)

  if col == 1 then
    return "<bs>" -- if at the beginning then just delete the newline
  else
    -- if before cursor is all spaces then delete them
    return '<esc>"_d' .. (before_cur:match("^%s+$") and "0s" or "bs")
  end
end

return { backspace_del = backspace_del }
