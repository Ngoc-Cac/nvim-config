local config_path = vim.fn.stdpath("config")

return {
    {
        dir = config_path .. "/custom-plugs/terminal",
        name = "toggle-terminal",
        opts = {}
    },
    {
        dir = config_path .. "/custom-plugs/buffers",
        name = "buffers",
        opts = {}
    }
}
