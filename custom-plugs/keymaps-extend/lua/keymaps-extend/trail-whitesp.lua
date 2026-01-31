local normal_types = { char = true, line = true, block = true }

local function trail_whitesp_del(type)
  local prev_reg = vim.fn.getreg("/")
  -- use '[ and '] in normal mode motions
  local range = normal_types[type] and "'[,']" or "'<,'>"

  -- substitute from start to end and then clear the highlighting
  vim.cmd(range .. [[s/\s\+$//e | nohl]])
  vim.fn.setreg("/", prev_reg)
end

return { trail_whitesp_del = trail_whitesp_del }
