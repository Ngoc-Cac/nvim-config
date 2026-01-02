local function set_markview_keymap()
    vim.keymap.set(
        "n", "<leader>mm", ":Markview toggle<CR>",
        { desc = "Toggle Markdown preview for current buffer" }
    )
    vim.keymap.set(
        "n", "<leader>mv", ":Markview splitToggle<CR>",
        { desc = "Toggle Markdown split preview for current buffer" }
    )
end

return {
    -- markdown previewer
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        opts = { preview = { enable = false } },
        config = set_markview_keymap
    },
    -- color previewer
    {
        "norcalli/nvim-colorizer.lua",
        opts = {
            vim = { mode = "foreground" },
            lua = { mode = "foreground" }
        }
    },
}
