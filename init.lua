-- doing this for lazy vim
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General Config
require("config.general")

-- some common shortcuts I'm used to
require("key-mappings")

-- custom plugins
require("custom-plugs")

-- setup lazy.nvim and plugins 
require("config.lazy")

vim.cmd.colorscheme("jellybeans")
-- vim.cmd.colorscheme("gruvbox")
