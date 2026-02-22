local function backspace_del()
  -- if at the beginning then just delete the newline
  return vim.fn.col(".") == 1 and "<bs>" or '<esc>"_dbs'
end

return { backspace_del = backspace_del }
