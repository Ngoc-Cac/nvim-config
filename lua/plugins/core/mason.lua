return {
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        opts = {-- enable when issue
            -- log_level = vim.log.levels.DEBUG,
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim", "neovim/nvim-lspconfig",
            -- progress report for lsps
            { "j-hui/fidget.nvim", opts = {} }
        },
        opts = {
            automatic_enable = {
                "bashls", "jsonls", "yamlls",

                "lua_ls",
                "markdown_oxide",
                "basedpyright", -- NOTE: pyrightconfig.json will override ls conf
            }
        },
    }
}
