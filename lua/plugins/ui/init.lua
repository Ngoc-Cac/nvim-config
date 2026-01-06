local which_key_spec = {
    { "\\t", group = "Toggle terminal" },
    { "<leader>f", group = "Telescope find and list" },
    { "<leader>g", group = "Git Utilities" },
    { "<leader>m", group = "Markdown preview" },
    { "<leader>s", group = "Treesj features" },
    { "gr", group = "LSP actions" }
}
local notify_config = {
    fps=1, timeout = 100,
    max_width = 60,
    top_down = false,
    render = "wrapped-default",
    stages = "static",
    merge_duplicates = true,
}

return {
    { "morhetz/gruvbox", priority = 1000 },
    { "mechatroner/rainbow_csv" },
    { "bling/vim-bufferline" },
    -- key mappings hint
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = { preset = "helix", spec = which_key_spec },
    },
    -- notification plugin
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
            vim.notify.setup(notify_config)
        end
    }
}
