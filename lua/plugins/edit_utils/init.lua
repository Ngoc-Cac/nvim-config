return {
    { "Vimjas/vim-python-pep8-indent", ft="python" },
    -- commenting code
    {
        "tpope/vim-commentary",
        keys = {
            "gcc", { "gc", mode = { "n", "x", "o" } },
            { "<C-_>", "<C-o>gcc", mode = "i", remap = true, desc = "Comment selected code." },
        }
    }
}
