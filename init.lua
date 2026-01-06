-- setup lazy.nvim
require("config.lazy")

-- General Config
require("config.general")

-- toggleable terminal settings
require("terminal")

require("buf_delete")

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
