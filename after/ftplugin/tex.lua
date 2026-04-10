-- NOTE: this doesn't mess with lazy-loading only because the `FileType` event
-- fires last. We load treesitter on `BufReadPost` and `BufNewFile`

local select = require("nvim-treesitter-textobjects.select").select_textobject
local move = require("nvim-treesitter-textobjects.move")

local keyset = function(lhs, textobj, desc)
  vim.keymap.set({ "x", "o" }, lhs, function()
    select(textobj, "textobjects")
  end, { desc = desc, buffer = true })
end
local keyjump = function(lhs, textobj, goto_func, desc)
  vim.keymap.set(
    { "n", "x", "o" }, lhs,
    function() goto_func(textobj, "textobjects") end,
    { desc = desc }
  )
end

keyset("a$", "@inline_formula.outer", "Inline math")
keyset("i$", "@inline_formula.inner", "Inline math")

keyset("ae", "@equation.outer", "Equation")
keyset("ie", "@equation.inner", "Equation")

keyset("af", "@block.outer", "Environment block")
keyset("if", "@block.inner", "Environment block")

keyjump("]f", "@block.outer", move.goto_next_start, "Next environment start")
keyjump("[f", "@block.outer", move.goto_previous_start, "Previous environment start")
keyjump("]F", "@block.outer", move.goto_next_end, "Next environment end")
keyjump("[F", "@block.outer", move.goto_previous_end, "Previous environment end")

keyjump("]e", "@equation.outer", move.goto_next_start, "Next equation start")
keyjump("[e", "@equation.outer", move.goto_previous_start, "Previous equation start")
keyjump("]E", "@equation.outer", move.goto_next_end, "Next equation end")
keyjump("[E", "@equation.outer", move.goto_previous_end, "Previous equation end")
