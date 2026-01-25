local function is_valid_win(win)
  return win and vim.api.nvim_win_is_valid(win)
end

local function is_valid_buf(buf)
  return buf and vim.api.nvim_buf_is_valid(buf)
end

local function create_term_buf()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_call(buf, vim.cmd.term)
  vim.cmd.startinsert()

  vim.bo[buf].bufhidden = "hide"
  vim.bo[buf].buflisted = false

  -- automatically close the tab if 'exit' is called 
  vim.api.nvim_create_autocmd("TermClose", {
    buffer = buf,
    once = true,
    callback = function()
      if vim.api.nvim_buf_is_loaded(buf) then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end,
  })
  return buf
end

local function create_win(buffer, opts)
  opts = opts or {}
  local split = opts.split or "right"
  local width = opts.width
  local height = opts.height

  local win_opts = {}
  if split == "float" then
    local ui = vim.api.nvim_list_uis()[1]
    local row = math.floor((ui.height - height) / 2) - 2
    local col = math.floor((ui.width - width)  / 2)

    win_opts = {
      relative = "editor",
      row = opts.row or row,
      col = opts.col or col,
      width = width, height = height,
      style = "minimal",
      border = "rounded",
      title = "Terminal",
      title_pos = "center"
    }
  else
    win_opts = {
      win = 0, -- create adjacent to cur win
      split = split,
      width = width,
      height = height
    }
  end

  return vim.api.nvim_open_win(buffer, true, win_opts)
end

return {
  is_valid_win = is_valid_win,
  is_valid_buf = is_valid_buf,
  create_term_buf = create_term_buf,
  create_win = create_win
}
