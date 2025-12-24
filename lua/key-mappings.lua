-- quick undo and redo in insert mode
vim.keymap.set("i", "<C-z>", "<Esc>ui")
vim.keymap.set("i", "<C-r>", "<C-r>i")

-- ctrl-backspace in insert mode
-- if at end of line: space -> normal -> "_cb
-- else move right once, enter normal mode and replace backwards
vim.keymap.set("i", "<C-h>", function()
    if vim.fn.col(".") == vim.fn.col("$") then
        return ' <Esc>"_cb'
    else
        return '<Right><Esc>"_cb'
    end
end, { expr = true })

-- coc tab completion
vim.keymap.set("i", "<Tab>", function()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#confirm"]()
    else
        return "<C-g>u<Tab>"
    end
end, { expr = true })
vim.keymap.set("i", "<Esc>", function()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#cancel"]()
    else
        return "<Esc>"
    end
end, { expr = true })
vim.keymap.set("i", "<CR>", function()
    if vim.fn["coc#pum#visible"]() == 1 then
        return vim.fn["coc#pum#confirm"]()
    else
        return require("nvim-autopairs").autopairs_cr()
    end
end, { expr = true })

-- insert mode commenting
vim.keymap.set("i", "<C-_>", "<C-o>gcc", { noremap = false })

-- dir tree shortcuts
vim.keymap.set({ "n", "i" }, "<C-b>", function()
    return "<CMD>Neotree show toggle<CR>"
end, { expr = true, noremap = false })

