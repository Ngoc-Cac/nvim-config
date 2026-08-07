vim.api.nvim_create_augroup("UtilAutoCmd", {clear = true})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = "UtilAutoCmd",
  desc = "Highlight the yanked text briefly",
  callback = function()
    vim.hl.on_yank({ higroup = "HighlightYank", timeout = 300 })
  end
})

vim.api.nvim_create_autocmd("FileType", {
  group = "UtilAutoCmd",
  desc = "Automatically enter insert mode for interactive git",
  pattern = { "gitcommit", "gitrebase" },
  command = "startinsert | 1"
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = "UtilAutoCmd",
  nested = true, -- allow nested autocmds
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local is_blank_buf = bufname == "" and #lines == 1 and lines[1] == ""

    if
      vim.fn.argc() ~= 0 or
      not is_blank_buf or
      #vim.api.nvim_list_wins() > 1 or
      vim.uv.guess_handle(0) == "pipe"
    then
      return
    end

    vim.schedule(function() vim.cmd("AutoSession search") end)
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  group = "UtilAutoCmd",
  desc = "Reset the cursor when exiting Neovim",
  command = "set guicursor=a:ver25"
})

vim.api.nvim_create_autocmd("CursorHold", {
  group = "UtilAutoCmd",
  desc = "Show diagnostic on cursor hover",
  callback = function()
    if #vim.diagnostic.get(0) == 0 then return end
    if not vim.b.diagnostics_pos then vim.b.diagnostics_pos = { nil, nil } end

    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    -- checked whether previous position is different to current 
    if not vim.deep_equal(cursor_pos, vim.b.diagnostics_pos) then
      vim.diagnostic.open_float()
    end

    vim.b.diagnostics_pos = cursor_pos
  end,
})
