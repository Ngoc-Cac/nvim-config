return {
    -- an even better fast-wrapping than auto-pairs
    {
        "nvim-mini/mini.surround",
        version = false,
        opts = {
            mappings = {
                add = "cs", delete = "ds",
                highlight = "gs", replace = "rs",
                find = "", find_left = "",
                suffix_last = "", suffix_next = ""
            }
        },
    },
    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = { fast_wrap = {} },
    },
}
