local function bind_textobj_keymaps()
  local select = require("nvim-treesitter-textobjects.select").select_textobject
  local keyset = function(lhs, textobj, desc)
    vim.keymap.set({ "x", "o" }, lhs, function()
      select(textobj, "textobjects")
    end, { desc = desc })
  end

  keyset("ap", "@parameter.outer", "Parameter")
  keyset("ip", "@parameter.inner", "Parameter")

  keyset("al", "@loop.outer", "Loop")
  keyset("il", "@loop.inner", "Loop")

  keyset("ai", "@conditional.outer", "Conditional")
  keyset("ii", "@conditional.inner", "Conditional")

  keyset("af", "@function.outer", "Function" )
  keyset("if", "@function.inner", "Function" )

  keyset("aF", "@call.outer", "Call")
  keyset("iF", "@call.inner", "Call")

  keyset("ac", "@class.outer", "Class")
  keyset("ic", "@class.inner", "Class")

  keyset("as", "@local.scope", "Scope Local")
end

local function bind_move_keys()
  local keyset = function(lhs, textobj, goto_func, desc)
    vim.keymap.set(
      { "n", "x", "o" }, lhs,
      function() goto_func(textobj, "textobjects") end,
      { desc = desc }
    )
  end
  local move = require("nvim-treesitter-textobjects.move")

  keyset("]f", "@function.outer", move.goto_next_start, "Next function start")
  keyset("[f", "@function.outer", move.goto_previous_start, "Previous function start")
  keyset("]F", "@function.outer", move.goto_next_end, "Next function end")
  keyset("[F", "@function.outer", move.goto_previous_end, "Previous function end")

  keyset("]c", "@class.outer", move.goto_next_start, "Next class start")
  keyset("[c", "@class.outer", move.goto_previous_start, "Previous class start")
  keyset("]C", "@class.outer", move.goto_next_end, "Next class end")
  keyset("[C", "@class.outer", move.goto_previous_end, "Previous class end")
end

local parsers = {
  "bash", "c", "comment", "css", "dockerfile", "ssh_config",

  "git_config", "git_rebase", "gitattributes", "gitignore", "gitcommit",

  "hjson",  -- includes extended syntax like //
  "html", "javascript", "jsdoc",

  "rasi", "hyprlang", "kitty", -- for kitty.conf

  "latex", "lua", "luadoc", "luap",  -- for the regex pattern
  "markdown", "python", "readline", "regex",
  "requirements", "toml", "vimdoc", "yaml"
}

return {
  {
    "romus204/tree-sitter-manager.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate", "TSManager" },
    opts = {
      ensure_installed = parsers,
      auto_install = (vim.fn.has("win32") == 0),
      border = "rounded",
      highlight = true,
    },
    config = function(opts)
      require("tree-sitter-manager").setup(opts)
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = true,
    opts = {
      select = { lookahead = true },
      move = { enable = true }
    },
    config = function(_, opts)
      require("nvim-treesitter-textobjects").setup(opts)
      bind_textobj_keymaps()
      bind_move_keys()
    end
  }
}
