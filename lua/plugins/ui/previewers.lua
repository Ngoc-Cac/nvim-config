return {
    -- markdown previewer
    {
        "OXY2DEV/markview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        opts = { preview = { enable = false } },
        keys = {
            {
                "<leader>mm", ":Markview toggle<cr>",
                desc = "Toggle Markdown preview for current buffer"
            },
            {
                "<leader>mv", ":Markview splitToggle<cr>",
                desc = "Toggle Markdown split preview for current buffer"
            }
        }
    },
    -- color previewer
    {
        "norcalli/nvim-colorizer.lua",
        opts = {
            vim = { mode = "foreground" },
            lua = { mode = "foreground" }
        }
    },
}
