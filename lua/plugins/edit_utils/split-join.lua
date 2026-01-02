-- code split-join
return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        local sj = require("treesj")
        sj.setup({ use_default_keymaps = false })

        vim.keymap.set("n", "<leader>sm", sj.toggle, { desc = "Toggle treesj" })
        vim.keymap.set("n", "<leader>sj", sj.join, { desc = "Join code block with treesj" })
        vim.keymap.set("n", "<leader>ss", sj.toggle, { desc = "Split code block with treesj" })
    end,
}
