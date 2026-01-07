local glog = "G log --graph --oneline"
return {
    { "lewis6991/gitsigns.nvim" },
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", ":vertical G<cr>", desc = "Open vim-fugitive staging area" },
            { "<leader>gg", ":tab G<cr>", desc = "Open vim-fugitive staging area in a new tab." },
            { "<leader>gll", ":vertical" .. glog .. "<cr", desc = "Open Git Log" },
            { "<leader>glt", ":tab" .. glog .. "<cr", desc = "Open Git Log" },
            { "<leader>gp", ":G push", desc = "Type git push but you gotta make the choice." }
        }
    },
    -- has nice ui stuff 
    -- {
    --     "NeogitOrg/neogit",
    --     lazy = true,
    --     dependencies = {
    --         "nvim-lua/plenary.nvim", "sindrets/diffview.nvim",
    --         "nvim-telescope/telescope.nvim",
    --     },
    --     cmd = "Neogit",
    --     opts = {
    --         graph_style = "unicode",
    --     },
    --     keys = {
    --         {
    --             "<leader>gs",
    --             function() require("neogit").open({ kind = "floating" }) end,
    --             desc = "Git Status"
    --         },
    --         { "<leader>gb", ":Neogit branch<cr>", desc = "Git Branch" },
    --         { "<leader>gc", ":Neogit commit<cr>", desc = "Git Commit" },
    --         { "<leader>gl", ":Neogit log<cr>", desc = "Git Log" }
    --     },
    -- }
}
