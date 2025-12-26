-- setup lazy.nvim
require("config.lazy")

-- General Config
require("config.general")

-- toggleable terminal settings
require("terminal")

-- make lazy set up the plugins
require("lazy").setup("plugins")

-- some common shortcuts I'm used to
require("key-mappings")

vim.cmd.colorscheme("jellybeans")
vim.diagnostic.config({
    virtual_lines = true
})

local tel_bg = "#231c1c"
local TelescopePrompt = {
    TelescopePromptBorder = { bg = tel_bg },
    TelescopePreviewBorder = { bg = tel_bg },
    TelescopeResultsBorder = { bg = tel_bg },
    TelescopePromptNormal = { bg = tel_bg },
    TelescopePreviewNormal = { bg = tel_bg },
    TelescopeResultsNormal = { bg = tel_bg },
    TelescopePromptTitle = { bg = tel_bg },
    TelescopePreviewTitle = { bg = tel_bg },
    TelescopeResultsTitle = { bg = tel_bg },
}
for hl, col in pairs(TelescopePrompt) do
    vim.api.nvim_set_hl(0, hl, col)
end

