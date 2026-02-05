vim.api.nvim_set_hl(0, "HighlightYank", { bg = "#466973" })
vim.api.nvim_create_augroup("UtilAutoCmd", {clear = true})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = "UtilAutoCmd",
  desc = "Highlight the yanked text briefly",
  callback = function()
    vim.hl.on_yank({
      higroup = "HighlightYank",
      timeout = 300,
    })
  end
})

vim.api.nvim_create_autocmd("FileType", {
  group = "UtilAutoCmd",
  desc = "Automatically enter insert mode for interactive git",
  pattern = { "gitcommit", "gitrebase" },
  command = "startinsert | 1"
})

vim.api.nvim_create_autocmd("VimLeave", {
  group = "UtilAutoCmd",
  desc = "Reset the cursor when exiting Neovim",
  command =  "set guicursor=a:ver25"
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
