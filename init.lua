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


-- enable syntax highlighting with treesitter
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python", "json" , "markdown"},
    callback = function() vim.treesitter.start() end,
})

vim.cmd.colorscheme("jellybeans")

---- alpha greeting screen and session manager
--require("alpha").setup(
--    require("alpha.themes.startify").config
--)

