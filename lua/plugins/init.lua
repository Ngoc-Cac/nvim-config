return {
    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim" },
        enabled=false,
        opts = {
            disabled_keys = {
                ["<Left>"] = {"n", "v"},
                ["<Right>"] = {"n", "v"},
            }
        },
    },
    { "Weyaaron/nvim-training", pin= true, opts = {}, enabled = false },
    -- progress report for lsps
    { "j-hui/fidget.nvim", opts = {} },
}
