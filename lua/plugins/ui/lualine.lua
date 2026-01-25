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

local sections = {
  lualine_a = {},
  lualine_b = { "filetype", "lsp_status" },
  lualine_c = {{ "filename", path = 1 }},
  lualine_x = {
    "encoding",
    {
      "fileformat",
      icons_enabled = true,
      symbols = { unix = "LF", dos = "CRLF", mac = "CR" },
    }
  },
}
local tabline = {
  lualine_a = { "mode", "branch" },
  lualine_b = {
    {
      "diagnostics",
      sections = { "error", "warn", "hint", "info" },
      always_visible = true
    },
    { "diff", draw_empty = true, source = diff_source },
  },
  lualine_z = {{ "tabs", mode = 2, max_length = vim.o.columns }},
  lualine_c = {}, lualine_y = {}, lualine_x = {}
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = { theme = "gruvbox-material" },
    sections = sections,
    tabline = tabline,
    winbar = {
      lualine_b = { "searchcount", "selectioncount" },
      lualine_x = {{ "buffers", max_length = vim.o.columns * 0.9 }},
    }
  }
}
