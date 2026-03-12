-- NOTE: this doesn't mess with lazy-loading only because the `FileType` event
-- fires last. We load treesitter on `BufReadPost` and `BufNewFile`

local select = require("nvim-treesitter-textobjects.select").select_textobject
local keyset = function(lhs, textobj, desc)
  vim.keymap.set({ "x", "o" }, lhs, function()
    select(textobj, "textobjects")
  end, { desc = desc, buffer = true })
end

keyset("a$", "@inline_formula.outer", "Inline math")
keyset("i$", "@inline_formula.inner", "Inline math")

keyset("ae", "@equation.outer", "Equation")
keyset("ie", "@equation.inner", "Equation")

keyset("af", "@block.outer", "Environment block")
keyset("if", "@block.inner", "Environment block")
