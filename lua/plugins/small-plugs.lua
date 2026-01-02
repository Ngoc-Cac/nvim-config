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
}
