local glog = "G log --graph --oneline"

return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<leader>gh", ":Gitsigns preview_hunk<cr>", desc = "Preview the current hunk" },
      { "<leader>gr", ":Gitsigns reset_hunk<cr>", desc = "Reset the current hunk" },
      { "<leader>gs", ":Gitsigns stage_hunk<cr>", desc = "Stage/Unstage the current hunk" }
    }
  },
  {
    "tpope/vim-fugitive",
    cmd = {  "Git", "G" },
    keys = {
      -- { "<leader>gs", ":vertical G<cr>", desc = "Open vim-fugitive staging area" },
      { "<leader>ga", ":Gwrite<cr>", desc = "Stage all changes in the current buffer" },
      { "<leader>gc", ":G commit<cr>", desc = "Commit the staged changes" },
      { "<leader>gg", ":tab G<cr>", desc = "Open vim-fugitive staging area" },
      { "<leader>glv", ":vertical " .. glog .. "<cr>", desc = "Open Git Log in vertical split" },
      { "<leader>gll", ":tab " .. glog .. "<cr>", desc = "Open Git Log in new tab" },
      { "<leader>gp", ":G push", desc = "Populate the command-line with git push" }
    }
  }
}
