-- General Config
require("globals")  -- this must be loaded first, has some important configs
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


vim.pack.add({
  { src = "https://github.com/folke/lazy.nvim", version = 'stable' }
})

-- make lazy set up the plugins
local not_vscode = not vim.g.vscode
require("lazy").setup({
  profiling = { loader = true },
  spec = {
    { import = "colorschemes" },
    { import = "plugins", cond = not_vscode },
    { import = "plugins.core", cond = not_vscode },
    { import = "plugins.ui", cond = not_vscode },
    { import = "plugins.edit_utils" },
    { import = "plugins.qol", cond = not_vscode }
  },
})

vim.keymap.set(
  "n", "<leader>l", ":Lazy<CR>",
  { desc = "Open the lazy.nvim menu" }
)

-- vim.cmd.colorscheme("monokai-pro")
vim.cmd.colorscheme("jellybeans")
