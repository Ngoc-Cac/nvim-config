local function backspace_del()
  -- if at end of line: space -> normal -> "_cb
  -- else move right once, enter normal mode and replace backwards
  return (vim.fn.col(".") == vim.fn.col("$") and " " or "<right>") .. '<esc>"_cb'
end

return { backspace_del = backspace_del }
