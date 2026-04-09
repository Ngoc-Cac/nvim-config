return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cmd = { "TSJJoin", "TSJSplit", "TSJToggle" },
  keys = {
    { "<leader>sj", ":TSJJoin<cr>", desc = "Join code block with treesj" },
    { "<leader>ss", ":TSJToggle<cr>", desc = "Toggle treesj" },
  },
  config = function()
    local sj = require("treesj")
    local lang_utils = require('treesj.langs.utils')

    local langs = {
      latex = {
        displayed_equation = lang_utils.set_default_preset({
          join = { space_in_brackets = true }
        }),
      }
    }
    sj.setup({
      use_default_keymaps = false,
      langs = langs
    })
  end,
}
