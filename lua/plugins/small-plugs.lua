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
        opts = {
            preset = "helix",
            spec = {
                { "\\t", group = "Toggle terminal" },
                { "<leader>f", group = "Telescope find and list" },
                { "<leader>g", group = "Telescope git utilities" },
                { "<leader>m", group = "Markdown preview" },
                { "<leader>s", group = "Treesj features" },
                { "gr", group = "LSP actions" }
            }
        },
    },
    -- commenting code
    {
        "tpope/vim-commentary",
        keys = {{
            "<C-_>", "<C-o>gcc", mode = "i", remap = true,
            desc = "Comment selected code."
        }}
    },
    -- code split-join
    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            local sj = require("treesj")
            sj.setup({ use_default_keymaps = false })

            vim.keymap.set("n", "<leader>sm", sj.toggle, { desc = "Toggle treesj" })
            vim.keymap.set("n", "<leader>sj", sj.join, { desc = "Join code block with treesj" })
            vim.keymap.set("n", "<leader>ss", sj.toggle, { desc = "Split code block with treesj" })
        end,
    },
    -- git plugins
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },
    --
    { "j-hui/fidget.nvim", opts = {} }, -- progress report for lsps
    { "terryma/vim-multiple-cursors" },
    { "Vimjas/vim-python-pep8-indent" },
    { "mechatroner/rainbow_csv" },
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
