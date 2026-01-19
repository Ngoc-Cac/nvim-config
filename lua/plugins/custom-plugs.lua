local custom_plugins = vim.fn.stdpath("config") .. "/custom-plugs/"

return {
    {
        dir = custom_plugins .. "toggle-terminal",
        cmd = "ToggleTerm",
        keys = {
            {
                "<localleader>tv", ":ToggleTerm right<cr>",
                desc = "Toggle terminal in split view.",
            },
            {
                "<localleader>tf", ":ToggleTerm float<cr>",
                desc = "Toggle terminal in float window.",
            },
        },
        opts = {
            split = { width_ratio = 0.45 },
            float = { float_ratio = 0.85 }
        }
    },
    {
        dir = custom_plugins .. "buffer-utils",
        cmd = "R",
        keys = {
            { "<localleader>bd", desc = "Delete the current buffer." },
            {
                "<localleader>bb", ":%bd|e#|b#",
                desc = "Delete all buffers except the current one."
            }
        },
        opts = {}
    },
    {
        dir = custom_plugins .. "keymaps-extend",
        keys = {
            { "<c-h>", mode = { "i" } },
            { "<leader>c", mode = { "n", "x", "o" }, desc = "Del trailing whitespaces" },
            { "<leader>cc", desc = "Del trailing whitespaces for the current line" }
        },
        opts = {}
    }
}
