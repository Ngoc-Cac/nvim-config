local keyset = vim.keymap.set

-- escape key
keyset("i", "jj", "<Esc>")

-- quick undo and redo in insert mode
keyset("i", "<C-z>", "<C-o>u")
keyset("i", "<C-r>", "<C-o><C-r>")

-- saving with ctrl-s
keyset("n", "<C-s>", ":w<CR>")
keyset("i", "<C-s>", "<C-o>:w<CR>")

-- ctrl-backspace in insert mode
-- if at end of line: space -> normal -> "_cb
-- else move right once, enter normal mode and replace backwards
keyset("i", "<C-h>", function()
    if vim.fn.col(".") == vim.fn.col("$") then
        return ' <Esc>"_cb'
    else return '<Right><Esc>"_cb' end
end, { expr = true })

-- alt + motion to move line up and down
keyset("n", "<M-j>", ":m+<CR>==")
keyset("n", "<M-k>", ":m-2<CR>==")
keyset("v", "<M-j>", ":m'>+1<CR>gv=gv")
keyset("v", "<M-k>", ":m'<-2<CR>gv=gv")

-- better page down and pge up
keyset("n", "<C-d>", "<C-d>zz")
keyset("n", "<C-u>", "<C-u>zz")
