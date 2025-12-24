return {
    {
        "neoclide/coc.nvim",
        branch = "release",
    },
    {
        "tpope/vim-commentary",
    },
    {
        "OXY2DEV/markview.nvim",
        opts = {
            preview = { enable = false }
        }
    },
    {
        "vim-airline/vim-airline",
        init = function()
            vim.g["airline#extensions#tabline#enabled"] = 1
            vim.g["airline#extensions#branch#enabled"] = 1
        end
    },
    {
        "terryma/vim-multiple-cursors"
    },
    {
        "windwp/nvim-autopairs",
        opts = { fast_wrap = {} }
    },
    {
        "norcalli/nvim-colorizer.lua",
        opts = {
            vim = { mode = "foreground" },
            lua = { mode = "foreground" }
        }
    },
    {
        "mechatroner/rainbow_csv"
    }
}
