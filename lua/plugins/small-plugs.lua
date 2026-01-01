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
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },
    -- markdown previewer
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        opts = { preview = { enable = false } },
        config = function()
            vim.keymap.set(
                "n", "<leader>mm", ":Markview toggle<CR>",
                { desc = "Toggle Markdown preview for current buffer" }
            )
            vim.keymap.set(
                "n", "<leader>mv", ":Markview splitToggle<CR>",
                { desc = "Toggle Markdown split preview for current buffer" }
            )
        end
    },
    { "terryma/vim-multiple-cursors" },
    { "Vimjas/vim-python-pep8-indent" },
    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = { fast_wrap = {} },
    },
    -- color previewer
    {
        "norcalli/nvim-colorizer.lua",
        opts = {
            vim = { mode = "foreground" },
            lua = { mode = "foreground" }
        }
    },
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
            })
        end
    }
}
