local lsp_servers = {
    "bashls", "jsonls", "yamlls",

    "lua_ls",
    "markdown_oxide",
    "basedpyright", -- NOTE: pyrightconfig.json will override ls conf
}
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
        dependencies = { "mason-org/mason.nvim" },
        lazy = true, -- we manually load it in nvim-lspconfig
        opts = { automatic_enable = lsp_servers }
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            -- progress report for lsps
            { "j-hui/fidget.nvim", opts = {} }
        },
        config = function()
            -- show lsp diagnostics as virtual line
            vim.diagnostic.config({ virtual_lines = true })
            vim.lsp.inlay_hint.enable(true)

        end
    }
}
