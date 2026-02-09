local function bind_textobj_keymaps(select_module)
  local keyset = function(lhs, rhs, desc)
    vim.keymap.set({ "x", "o" }, lhs, rhs, { desc = desc })
  end
  local select = select_module.select_textobject

  keyset("ap", function() select("@parameter.outer", "textobjects") end, "Parameter")
  keyset("ip", function() select("@parameter.inner", "textobjects") end, "Parameter")

  keyset("al", function() select("@loop.outer", "textobjects") end, "Loop")
  keyset("il", function() select("@loop.inner", "textobjects") end, "Loop")

  keyset("ai", function() select("@conditional.outer", "textobjects") end, "Conditional")
  keyset("ii", function() select("@conditional.inner", "textobjects") end, "Conditional")

  keyset("af", function() select("@function.outer", "textobjects") end, "Function")
  keyset("if", function() select("@function.inner", "textobjects") end, "Function")

  keyset("ac", function() select("@class.outer", "textobjects") end, "Class")
  keyset("ic", function() select("@class.inner", "textobjects") end, "Class")

  keyset("as", function() select("@local.scope", "locals") end, "Scope Local")
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
      -- configuration
      require("nvim-treesitter-textobjects").setup(opts)
      bind_textobj_keymaps(require("nvim-treesitter-textobjects.select"))
    end
  }
}
