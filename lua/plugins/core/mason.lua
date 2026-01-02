return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        automatic_enable = {
            "bashls", "jsonls", "yamlls",

            "lua_ls",
            "markdown_oxide",
            "basedpyright", -- NOTE: pyrightconfig.json will override ls conf
        }
    },
    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {-- enable when issue
                -- log_level = vim.log.levels.DEBUG,
            }
        },
        "neovim/nvim-lspconfig",
    },
}
