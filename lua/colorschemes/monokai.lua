local function override_hl_grp(c)
  return {
    PythonModule = { fg = "#cd2d49" },  -- lsp overrides the token
    Property = { fg = "#b690ce" },
    Type = { fg = "#8bff3a", italic = true },

    ["@punctuation.delimiter"] = { fg = "#8fbfdc" },

    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@keyword.function"] = { link = "@keyword" },
    ["@function"] = { fg = "#00dee4" },
    ["@function.builtin"] = { link = "@function" },
    ["@function.call"] = { link = "@function" },
    ["@variable.parameter"] = { fg = "#00e4b8" },
    ["@variable.builtin"] = { italic = false, fg = "#c6b6ee" },

    ["@lsp.type.property.lua"] = { link = "Property" },

    ["@lsp.mod.static.python"] = { fg = "#7e83ce" },

    ["@lsp.type.parameter.python"] = { fg = c.base.green },
    ["@lsp.type.decorator.python"] = { fg = "#ff8944" }, -- #e26d2a
    ["@lsp.type.property.python"] = { link = "Property" },
    ["@lsp.type.namespace.python"] = { link = "PythonModule" }
  }
end

return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    filter = "Spectrum",
    styles = {
      keyword = false,
      parameter = false,
    },
    plugins = {
      indent_blankline = { context_highlight = "pro" },
    },
    disabled_plugins = {
      "hrsh7th/nvim-cmp", "SmiteshP/nvim-navic",
      "neoclide/coc.nvim", "nvim-mini/mini.nvim",
      "nvimdev/dashboard-nvim"
    },
    override = override_hl_grp
  },
}
