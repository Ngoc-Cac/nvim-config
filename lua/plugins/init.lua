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
    -- git plugins
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },
    --
    { "j-hui/fidget.nvim", opts = {} }, -- progress report for lsps
}
