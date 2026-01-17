local which_key_spec = {
    { "<localleader>t", group = "Toggle terminal" },
    { "<localleader>b", group = "Buffer actions" },
    { "<localleader>s", group = "SessionManager features" },
    { "<leader>f", group = "Telescope find and list" },
    { "<leader>g", group = "Git Utilities" },
    { "<leader>gl", group = "Git Log" },
    { "<leader>m", group = "Markdown preview" },
    { "<leader>o", group = "Oil.nvim key-mappings" },
    { "<leader>s", group = "Treesj features" },
    { "gr", group = "LSP actions" }
}

return {
    { "morhetz/gruvbox", priority = 1000, enabled = false },
    { "mechatroner/rainbow_csv", ft="csv" },
    -- key mappings hint
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
            spec = which_key_spec,
            win = { title_pos = "center" }
        },
    },
    -- notification plugin
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        opts = {
            fps=1, timeout = 2000,
            max_width = 60,
            top_down = false,
            render = "wrapped-default",
            stages = "static",
            merge_duplicates = true,
        },
        config = function(_, opts)
            vim.notify = require("notify")
            vim.notify.setup(opts)
        end
    },
    -- indentation guide
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile", "VeryLazy" },
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            scope = { show_start = false, show_end = false }
        },
    }
}
