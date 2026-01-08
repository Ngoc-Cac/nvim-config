-- setup lazy.nvim
require("config.lazy")

-- General Config
require("config.general")

-- custom plugins
require("custom-plugs")

-- some common shortcuts I'm used to
require("key-mappings")

-- make lazy set up the plugins
require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.core" },
    { import = "plugins.ui" },
    { import = "plugins.edit_utils" }
})

vim.cmd.colorscheme("jellybeans")
-- vim.cmd.colorscheme("gruvbox")
