return {
    -- markdown previewer
    {
        "OXY2DEV/markview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        enabled = false,
        lazy = true,
        cmd = "Markview",
        keys = {
            {
                "<leader>mm", ":Markview toggle<cr>",
                desc = "Toggle Markdown preview for current buffer"
            },
            {
                "<leader>mv", ":Markview splitToggle<cr>",
                desc = "Toggle Markdown split preview for current buffer"
            }
        },
        opts = { preview = { enable = false } },
    },
    -- color previewer
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        opts = {
            vim = { mode = "foreground" },
            lua = { mode = "foreground" }
        }
    },
}
