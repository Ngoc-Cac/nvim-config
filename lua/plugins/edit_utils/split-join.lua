return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = {
    { "<leader>sm", desc = "Toggle treesj" },
    { "<leader>sj", desc = "Join code block with treesj" },
    { "<leader>ss", desc = "Split code block with treesj" },
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

    vim.keymap.set("n", "<leader>sm", sj.toggle)
    vim.keymap.set("n", "<leader>sj", sj.join)
    vim.keymap.set("n", "<leader>ss", sj.toggle)
  end,
}
