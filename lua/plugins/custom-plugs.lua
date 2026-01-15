local config_path = vim.fn.stdpath("config")

return {
    {
        dir = config_path .. "/custom-plugs/terminal",
        name = "toggle-terminal",
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
        dir = config_path .. "/custom-plugs/buffers",
        name = "buffers",
        cmd = "R",
        keys = {
            { "<localleader>bd", desc = "Delete the current buffer." },
            { "<localleader>bb", desc = "Delete all buffers except the current one." }
        },
        opts = {}
    }
}
