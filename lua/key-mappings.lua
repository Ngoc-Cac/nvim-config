local keyset = vim.keymap.set

-- quick undo and redo in insert mode
keyset("i", "<C-z>", "<Esc>ui")
keyset("i", "<C-r>", "<C-r>i")

-- ctrl-backspace in insert mode
-- if at end of line: space -> normal -> "_cb
-- else move right once, enter normal mode and replace backwards
keyset("i", "<C-h>", function()
    if vim.fn.col(".") == vim.fn.col("$") then
        return ' <Esc>"_cb'
    else return '<Right><Esc>"_cb' end
end, { expr = true })

