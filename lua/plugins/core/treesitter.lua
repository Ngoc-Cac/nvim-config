local function bind_textobj_keymaps()
  local keyset = function(lhs, rhs, desc)
    vim.keymap.set({ "x", "o" }, lhs, rhs, { desc = desc })
  end
  local select = require("nvim-treesitter-textobjects.select").select_textobject

  keyset("ap", function() select("@parameter.outer", "textobjects") end, "Parameter")
  keyset("ip", function() select("@parameter.inner", "textobjects") end, "Parameter")

  keyset("al", function() select("@loop.outer", "textobjects") end, "Loop")
  keyset("il", function() select("@loop.inner", "textobjects") end, "Loop")

  keyset("ai", function() select("@conditional.outer", "textobjects") end, "Conditional")
  keyset("ii", function() select("@conditional.inner", "textobjects") end, "Conditional")

  keyset("af", function() select(
    vim.bo.filetype == "tex" and "@block.outer" or "@function.outer",
    "textobjects"
  ) end, "Function")
  keyset("if", function() select(
    vim.bo.filetype == "tex" and "@block.inner" or "@function.inner",
    "textobjects"
  ) end, "Function")
  keyset("aF", function() select("@call.outer", "textobjects") end, "Call")
  keyset("iF", function() select("@call.inner", "textobjects") end, "Call")

  keyset("ac", function() select("@class.outer", "textobjects") end, "Class")
  keyset("ic", function() select("@class.inner", "textobjects") end, "Class")

  keyset("as", function() select("@local.scope", "locals") end, "Scope Local")
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
