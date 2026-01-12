local blink_opts = {
    cmdline = { enabled = false },
    keymap = {
        preset = "super-tab",
        ["<Esc>"] = { "hide", "hide_documentation", "hide_signature", "fallback" },
        ["<CR>"] = { "select_and_accept", "fallback" }
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

    sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
            -- setting up a provider for lazydev
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                -- make lazydev completions top priority (see `:h blink.cmp`)
                score_offset = 100,
            },
        },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
}

return {
    -- extends the base lua LSP to recognize my neovim configurations
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
        event = { "InsertEnter", "CmdwinEnter" },
        opts = blink_opts,
        opts_extend = { "sources.default" }
    }
}
