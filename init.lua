-- doing this for lazy vim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General Config
require("config.general")

-- some common shortcuts I'm used to
require("key-mappings")

-- do not load the plugins if this file is
-- being called from the vscode extension
if vim.g.vscode then return end

-- setup lazy.nvim and plugins 
require("config.lazy")

vim.cmd.colorscheme("jellybeans")
-- vim.cmd.colorscheme("gruvbox")
