local function get_latex_env(env)
  if env == "[" then
    return "\\[ ", " \\]"
  elseif env == "]" then
    return "\\[", "\\]"
  else
    return string.format("\\begin{%s}", env), string.format("\\end{%s}", env)
  end
end

local custom_surrounds = {
  ["e"] = {  -- latex environment
    input = function()
      local env = MiniSurround.user_input("Environment")
      if not env then return {} end

      local left, right = get_latex_env(env)
      return { vim.pesc(left) .. "().-()" .. vim.pesc(right) }
    end,
    output = function()
      local env = MiniSurround.user_input("Environment")
      if not env then return {} end

      local left, right = get_latex_env(env)
      return { left = left, right = right }
    end
  },
  ["c"] = {  -- latex command
    input = function()
      local com = MiniSurround.user_input("Command")
      return com and { vim.pesc(string.format("\\%s{", com)) .. "().-()}" } or {}
    end,
    output = function()
      local com = MiniSurround.user_input("Command")
      return com and { left = string.format("\\%s{", com), right = "}" } or {}
    end
  }
}

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
      custom_surroundings = custom_surrounds,
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
      local cond = require("nvim-autopairs.conds")
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
