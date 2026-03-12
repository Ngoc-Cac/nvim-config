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
  local keyset = function(lhs, rhs, desc)
    vim.keymap.set({ "n", "x", "o" }, lhs, rhs, { desc = desc })
  end
  local move = require("nvim-treesitter-textobjects.move")

  keyset("]f", function()
    move.goto_next_start("@function.outer", "textobjects")
  end, "Next function start")
  keyset("]F", function()
    move.goto_next_end("@function.outer", "textobjects")
  end, "Next function end")
  keyset("[f", function()
    move.goto_previous_start("@function.outer", "textobjects")
  end, "Next function start")
  keyset("[F", function()
    move.goto_previous_end("@function.outer", "textobjects")
  end, "Next function end")

  keyset("]c", function()
    move.goto_next_start("@class.outer", "textobjects")
  end, "Next class start")
  keyset("]C", function()
    move.goto_next_end("@class.outer", "textobjects")
  end, "Next class end")
  keyset("[c", function()
    move.goto_previous_start("@function.outer", "textobjects")
  end, "Next function start")
  keyset("[C", function()
    move.goto_previous_end("@function.outer", "textobjects")
  end, "Next function end")
end

-- enable syntax highlighting with treesitter
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "gitignore", "dockerfile", "requirements",
    "readline",

    "json", "yaml", "toml",
    "markdown", "tex", "html", "css",
    "sh", "lua", "python", "javascript",
  },
  callback = function() vim.treesitter.start() end,
})

return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- build = ':TSUpdate',
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate", "TSUninstall", "TSLog" },
    opts = {}
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
