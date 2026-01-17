-- doing this for lazy vim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General Config
require("config.general")

require("key-mappings")
require("autocmds")

-- do not load the plugins if this file is
-- being called from the vscode extension
if vim.g.vscode then return end

-- setup lazy.nvim and plugins 
require("config.lazy")
