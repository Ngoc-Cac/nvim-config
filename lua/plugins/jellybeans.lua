return {
    "wtfox/jellybeans.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        on_colors = function(c)
            local bg_dark_coffee = "#2b2522"
            local bg_coffee = "#2b2522"
            c.background = bg_coffee
        end,
        on_highlights = function(hl, c)
            hl.Type = { italic = false }
            hl["@variable.parameter"] = { italic = false }
            -- hl["@variable.member"] = { fg = "#8c8c70" }
            -- hl["@variable.member"] = { fg = "#a3a377" }
            hl["@variable.member"] = { fg = "#b8b864" }
        end
    },
    config = function()
        vim.cmd.colorscheme("jellybeans")
    end,
}
