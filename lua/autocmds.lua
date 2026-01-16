vim.api.nvim_create_augroup("UtilAutoCmd", {clear = true})

vim.api.nvim_set_hl(0, "HighlightYank", { bg = "#466973" })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = "UtilAutoCmd",
    desc = "Highlight the yanked text briefly",
    callback = function()
        vim.hl.on_yank({
            higroup = "HighlightYank",
            timeout = 300,
        })
    end
})

local cmd =  "startinsert | 1" -- have to do this or treesitter screams at me :(
vim.api.nvim_create_autocmd("FileType", {
    group = "UtilAutoCmd",
    desc = "Automatically enter insert mode for interactive git",
    pattern = { "gitcommit", "gitrebase" },
    command = cmd
})

local reset_cur = "set guicursor=a:ver25"
vim.api.nvim_create_autocmd("VimLeave", {
    group = "UtilAutoCmd",
    desc = "Reset the cursor when exiting Neovim",
    command = reset_cur,
})
