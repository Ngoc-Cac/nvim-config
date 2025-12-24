-- General Config
require("vanilla-conf.general-conf")

-- toggleable terminal settings
require("vanilla-conf.terminal")

-- setup lazy.nvim
require("config.lazy")
-- make lazy set up the plugins
require("lazy").setup("plugins")

---- some common shortcuts I'm used to
vim.cmd.runtime("sub-config/key-mappings.vim")

vim.cmd.colorscheme("jellybeans")

---- alpha greeting screen and session manager
--require("alpha").setup(
--    require("alpha.themes.startify").config
--)

