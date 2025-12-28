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
    -- commenting code
    {
        "tpope/vim-commentary",
        keys = {{
            "<C-_>", "<C-o>gcc", mode = "i", remap = true,
            desc = "Comment selected code."
        }}
    },
    { "tpope/vim-fugitive" },
    -- markdown previewer
    {
        "OXY2DEV/markview.nvim",
        opts = {
            preview = { enable = false }
        }
    },
    { "terryma/vim-multiple-cursors" },
    { "Vimjas/vim-python-pep8-indent" },
    -- status line
    {
        "vim-airline/vim-airline",
        init = function()
            vim.g.airline_powerline_fonts = 1

            vim.g["airline#extensions#tabline#enabled"] = 1
            vim.g["airline#extensions#tabline#formatter"] = "unique_tail_improved"

            vim.g["airline#extensions#branch#enabled"] = 1
        end,
        -- config = function()
        --     vim.g.airline_section_a = vim.fn["airline#section#create"]({
        --         'mode', ' ',
        --         vim.fn["airline#extensions#branch#get_head"]()
        --     })
        -- end
    },
    -- autopairs
    {
        "windwp/nvim-autopairs",
        opts = { fast_wrap = {} },
        lazy = false
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
                timeout = 100,
                max_width = 60,
                top_down = false,
                render = "wrapped-default",
                stages = "fade",
            })
        end
    }
}
