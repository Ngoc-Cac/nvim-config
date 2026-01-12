local glog = "G log --graph --oneline"

return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile", "VeryLazy" }
    },
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", ":vertical G<cr>", desc = "Open vim-fugitive staging area" },
            { "<leader>gg", ":tab G<cr>", desc = "Open vim-fugitive staging area in a new tab." },
            { "<leader>glv", ":vertical " .. glog .. "<cr>", desc = "Open Git Log in vertical split" },
            { "<leader>gll", ":tab " .. glog .. "<cr>", desc = "Open Git Log in new tab." },
            { "<leader>gp", ":G push", desc = "Populate the command-line with git push" }
        }
    }
}
