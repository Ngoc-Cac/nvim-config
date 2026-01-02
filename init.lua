-- setup lazy.nvim
require("config.lazy")

-- General Config
require("config.general")

-- toggleable terminal settings
require("terminal")

-- make lazy set up the plugins
require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.ui" }
})

-- some common shortcuts I'm used to
require("key-mappings")

vim.cmd.colorscheme("jellybeans")
