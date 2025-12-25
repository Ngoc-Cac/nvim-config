return {
    {
        "tpope/vim-commentary",
        keys = {{
            "<C-_>", "<C-o>gcc", mode = "i", remap = true,
            desc = "Comment selected code."
        }}
    },
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
