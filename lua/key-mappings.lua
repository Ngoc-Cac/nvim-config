local keyset = vim.keymap.set

-- escape key
keyset("i", "jj", "<esc>")
keyset("c", "jj", "<c-c>")
keyset(
    "t", "<esc><esc>", "<C-\\><C-n>",
    { desc = "Exit terminal mode." }
)
-- not recommended because this can be
-- annoying when doing interactive git
-- vim.keymap.set(
--     "t", "jj", "<C-\\><C-n>",
--     { desc = "Exit terminal mode." }
-- )

-- quick command mode
keyset({ "n", "v" }, ";", ":", { desc = "Enter command-line mode" })

-- quick undo and redo in insert mode
keyset("i", "<c-r>", "<c-o><c-r>")

-- saving with ctrl-s
keyset("n", "<c-s>", ":w<cr>")
keyset("i", "<c-s>", "<c-o>:w<cr>")

-- ctrl-backspace in insert mode
-- if at end of line: space -> normal -> "_cb
-- else move right once, enter normal mode and replace backwards
keyset("i", "<c-h>", function()
    return (vim.fn.col(".") == vim.fn.col("$") and " " or "<right>") .. '<esc>"_cb'
end, { expr = true })
-- delete everything in file
keyset("n", "X", ":%d_<cr>")

-- alt + motion to move line up and down
keyset("n", "<m-j>", ":m+<cr>==")
keyset("n", "<m-k>", ":m-2<cr>==")
keyset("v", "<m-j>", ":m'>+1<cr>gv=gv")
keyset("v", "<m-k>", ":m'<-2<cr>gv=gv")
