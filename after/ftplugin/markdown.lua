vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.wrap = true

vim.keymap.set(
  "n", "<localleader>m",
  ":MarkdownPreviewToggle<cr>",
  { desc = "Toggle md preview", buffer = true }
)
