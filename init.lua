-- doing this for lazy vim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General Config
require("options")
require("key-mappings")
require("autocmds")

-- setup lazy.nvim and plugins 
require("config.lazy")
