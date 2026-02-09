-- doing this for lazy vim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- registering all tex file as tex, so treesitter can parse it
vim.g.tex_flavor = "tex"
-- define a default clipboard provider so nvim doesn't source clipboard.vim 
if vim.fn.has("win32") == 1 then
  vim.g.clipboard = {
    name = 'win32yank',
    copy = {
      ["+"] = 'win32yank.exe -i --crlf',
      ["*"] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ["+"] = 'win32yank.exe -o --lf',
      ["*"] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 0,
  }
end

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

-- make lazy set up the plugins
local not_vscode = not vim.g.vscode
require("lazy").setup({
  profiling = { loader = true },
  spec = {
    { import = "colorschemes" },
    { import = "plugins", cond = not_vscode },
    { import = "plugins.core", cond = not_vscode },
    { import = "plugins.ui", cond = not_vscode },
    { import = "plugins.edit_utils", cond = not_vscode }
  },
})

vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Open the lazy.nvim menu" })

-- vim.cmd.colorscheme("monokai-pro")
vim.cmd.colorscheme("jellybeans")
