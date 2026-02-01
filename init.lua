-- doing this for lazy vim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General Config
require("options")
require("key-mappings")
require("autocmds")

vim.api.nvim_create_user_command("R",
  function(opts) vim.cmd("e " .. opts.args .. " | bd#") end,
  {
    nargs = 1, complete = "file",
    desc = "Replace the current buffer with a new one"
  }
)

-- setup lazy.nvim and plugins 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Open the lazy.nvim menu" })

-- make lazy set up the plugins
require("lazy").setup({
  defaults = { cond = not vim.g.vscode }, -- do not load being called from vscode
  profiling = { loader = true },
  spec = {
    { import = "colorschemes" },
    { import = "plugins" },
    { import = "plugins.core" },
    { import = "plugins.ui" },
    { import = "plugins.edit_utils" }
  },
})

-- vim.cmd.colorscheme("monokai-pro")
vim.cmd.colorscheme("jellybeans")
