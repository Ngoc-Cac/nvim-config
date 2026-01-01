return {
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            disabled_keys = {
                ["<Left>"] = {"n", "v"},
                ["<Right>"] = {"n", "v"},
            }
        },
    },
    -- key mappings hint
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { preset = "helix" },
    },
    -- commenting code
    {
        "tpope/vim-commentary",
        keys = {{
            "<C-_>", "<C-o>gcc", mode = "i", remap = true,
            desc = "Comment selected code."
        }}
    },
    -- git plugins
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },
    --
    { "terryma/vim-multiple-cursors" },
    { "Vimjas/vim-python-pep8-indent" },
    { "mechatroner/rainbow_csv" },
    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = { fast_wrap = {} },
    },
    -- notification plugin
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
            vim.notify.setup({
                fps=1,
                timeout = 100,
                max_width = 60,
                top_down = false,
                render = "wrapped-default",
                stages = "static",
                merge_duplicates = true,
            })
        end
    }
}
