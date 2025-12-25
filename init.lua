-- General Config
require("config.general")

-- toggleable terminal settings
require("terminal")

-- setup lazy.nvim
require("config.lazy")
-- make lazy set up the plugins
require("lazy").setup("plugins")

-- some common shortcuts I'm used to
require("key-mappings")

vim.cmd.colorscheme("jellybeans")

---- alpha greeting screen and session manager
--require("alpha").setup(
--    require("alpha.themes.startify").config
--)

