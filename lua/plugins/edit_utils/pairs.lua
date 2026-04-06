return {
  -- an even better fast-wrapping than auto-pairs
  {
    "nvim-mini/mini.surround",
    version = false,
    keys = {
      { "cs", mode = { "n", "x" } },
      "ds", "gs", "rs"
    },
    opts = {
      highlight_duration = 1000,
      mappings = {
        add = "cs", delete = "ds",
        highlight = "gs", replace = "rs",
        find = "", find_left = "",
        suffix_last = "", suffix_next = ""
      },
      respect_selection_type = true,  -- surround each line in the selection
    },
  },
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
    config = function(opts)
      local npairs = require("nvim-autopairs")
      local Rule = require("nvim-autopairs.rule")
      local cond = require('nvim-autopairs.conds')
      npairs.setup(opts)

      npairs.add_rules({
        Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_before_regex("\\", 1)),
        Rule("\\[", "\\]", { "tex", "latex" }),
        Rule("\\{", "\\}", { "tex", "latex" }),
        Rule("\\left(", "\\right)", { "tex", "latex" }),
        Rule("\\left[", "\\right]", { "tex", "latex" }),
        Rule("\\left\\{", "\\right\\}", { "tex", "latex" }),
        Rule("\\left|", "\\right|", { "tex", "latex" }),
      })
    end
  },
}
