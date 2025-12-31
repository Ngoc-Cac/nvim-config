local blink_opts = {
    cmdline = { enabled = false },
    keymap = {
        preset = "super-tab",
        ["<Esc>"] = { "hide", "hide_documentation", "hide_signature", "fallback" }
    },
    appearance = { nerd_font_variant = "normal" },
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 300,
            treesitter_highlighting = false
        },
    },
    signature = {
        enabled = true,
        window = {
            treesitter_highlighting = false,
            show_documentation = true,
        }
    },

    sources = { default = { "lsp", "path", "snippets", "buffer" } },
    fuzzy = { implementation = "prefer_rust_with_warning" }
}

return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = {
                "bashls",

                "jsonls", "yamlls",

                "lua_ls",
                "basedpyright", -- project-config will override ls conf
            }
        },
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {
                    -- enable when issue
                    -- log_level = vim.log.levels.DEBUG,
                }
            },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        opts = blink_opts,
        opts_extend = { "sources.default" }
    }
}
