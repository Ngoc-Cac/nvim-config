local blink_opts = {
  keymap = {
    preset = "super-tab",
    ["<Esc>"] = { "hide", "hide_documentation", "hide_signature", "fallback" },
    -- ["<CR>"] = { "select_and_accept", "fallback" }
  },
  appearance = { nerd_font_variant = "normal" },
  cmdline = { enabled = false },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 300,
      treesitter_highlighting = true
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
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      }
    }
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    event = { "InsertEnter", }, -- add "CmdwinEnter" if cmdline completion is enabled
    opts = blink_opts,
    opts_extend = { "sources.default" }
  }
}
