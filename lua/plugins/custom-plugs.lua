local custom_plugins = vim.fn.stdpath("config") .. "/custom-plugs/"

return {
  {
    dir = custom_plugins .. "toggle-terminal",
    cmd = "ToggleTerm",
    keys = {
      { "<localleader>tv", ":ToggleTerm right<cr>", desc = "Toggle split terminal" },
      { "<localleader>tf", ":ToggleTerm float<cr>", desc = "Toggle floating terminal" }
    },
    opts = {
      split = { width_ratio = 0.45 },
      float = { float_ratio = 0.85 }
    }
  },
  {
    dir = custom_plugins .. "buffer-utils",
    event = { "BufWinLeave", "BufDelete", "BufWipeout", "WinClosed" },
    keys = {
      { "<localleader>bd", desc = "Delete the current buffer." }
    },
    opts = {}
  },
  {
    dir = custom_plugins .. "keymaps-extend",
    keys = {
      { "<c-h>", mode = { "i" } },
      { "<leader>c", mode = { "n", "x", "o" }, desc = "Delete trailing whitespaces" }
    },
    opts = {}
  }
}
