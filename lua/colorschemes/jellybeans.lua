local tel_fg = {
  prompt = "#3fb75b",
  preview = "#d68d46",
  results = "#536ee4"
}
local tel_bg = "#231c1c"
local function config_hl_group(hl, c)
  hl.TelescopePromptTitle  = { bold = true, bg = tel_bg, fg = tel_fg["prompt"] }
  hl.TelescopePreviewTitle = { bold = true, bg = tel_bg, fg = tel_fg["preview"] }
  hl.TelescopeResultsTitle = { bold = true, bg = tel_bg, fg = tel_fg["results"] }

  hl.TelescopePromptBorder  = { bg = tel_bg, fg = tel_fg["prompt"] }
  hl.TelescopePreviewBorder = { bg = tel_bg, fg = tel_fg["preview"] }
  hl.TelescopeResultsBorder = { bg = tel_bg, fg = tel_fg["results"] }

  hl.TelescopePromptNormal  = { bg = tel_bg }
  hl.TelescopePreviewNormal = { bg = tel_bg }
  hl.TelescopeResultsNormal = { bg = tel_bg }

  hl.IblScope = { fg = c.green_smoke }
  hl.Property = { fg = "none" }
  hl.Type = { italic = false, fg = "#36db80" }

  hl["@module.python"] = { italic = false }
  hl["@variable.parameter"] = { italic = false, fg = "#ced19e" }
  hl["@variable.member"] = { fg = "#b690ce" }

  hl["@lsp.mod.static.python"] = { fg = "#7e83ce" }

  hl["@lsp.type.decorator.python"] = { fg = "#ff8944" } -- #e26d2a
  hl["@lsp.type.namespace.python"] = { fg = "#cd2d49" }
end

return {
  "wtfox/jellybeans.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    on_colors = function(c)
      local bg_coffee = "#2b2522"
      c.background = bg_coffee
    end,
    on_highlights = config_hl_group
  },
}
