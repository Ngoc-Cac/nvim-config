local function config_hl_group(hl, _)
  hl.Type = { italic = false, fg = "#36db80" }
  hl["@module.python"] = { italic = false }
  hl["@variable.parameter"] = { italic = false }

  hl["@lsp.mod.static.python"] = { fg = "#7e83ce" }

  hl["@lsp.type.decorator.python"] = { fg = "#ff8944" } -- #e26d2a
  hl["@lsp.type.property.python"] = { fg = "#b690ce" }
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
  config = function (_, opts)
    require("jellybeans").setup(opts)
    vim.cmd.colorscheme("jellybeans")
  end
}
