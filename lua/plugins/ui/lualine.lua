local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    opts = {
        options = {
            theme = "gruvbox-material"
        },
        sections = {
            lualine_a = { "mode", "branch" },
            lualine_b = { { "diff", source = diff_source }, "diagnostics" },
            lualine_c = { "buffers" },
            lualine_x = {
                "encoding", "filetype",
                {
                    "fileformat",
                    icons_enabled = true,
                    symbols = { unix = "LF", dos = "CRLF", mac = "CR" },
                }
           },
        },
        tabline = {
            lualine_a = {{ "tabs", mode = 1, path = 1 }},
            lualine_x = {{
                "buffers"
            }}
        }
    }
}
