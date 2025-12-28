return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "tpope/vim-commentary",
        keys = {{
            "<C-_>", "<C-o>gcc", mode = "i", remap = true,
            desc = "Comment selected code."
        }}
    },
    { "tpope/vim-fugitive" },
    {
        "OXY2DEV/markview.nvim",
        opts = {
            preview = { enable = false }
        }
    },
    { "terryma/vim-multiple-cursors" },
    { "Vimjas/vim-python-pep8-indent" },
    {
        "vim-airline/vim-airline",
        init = function()
            vim.g["airline#extensions#tabline#enabled"] = 1
            vim.g["airline#extensions#branch#enabled"] = 1
        end
    },
    {
        "windwp/nvim-autopairs",
        opts = { fast_wrap = {} },
        lazy = false
    },
    {
        "norcalli/nvim-colorizer.lua",
        opts = {
            vim = { mode = "foreground" },
            lua = { mode = "foreground" }
        }
    },
    { "mechatroner/rainbow_csv" },
}
