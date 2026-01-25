return {
  { "Vimjas/vim-python-pep8-indent", ft="python" },
  -- commenting code
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "x", "o" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "x", "o" }, desc = "Comment toggle blockwise" },
      { "<C-_>", "<C-o>gcc", mode = "i", remap = true, desc = "Comment selected code." }
    },
    opts = {}
  },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    keys = { "<m-K>", "<m-J>", "<c-n>", "<c-q>" },
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()
      local set = vim.keymap.set

      set({"n", "x"}, "<m-K>", function() mc.lineAddCursor(-1) end)
      set({"n", "x"}, "<m-J>", function() mc.lineAddCursor(1) end)
      set({"n", "x"}, "<c-n>", function() mc.matchAddCursor(1) end)

      -- only works in multi-cursor mode
      mc.addKeymapLayer(function(layerSet)
        layerSet({"n", "x"}, "<up>", mc.prevCursor)
        layerSet({"n", "x"}, "<down>", mc.nextCursor)
        layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)
        layerSet("n", "<esc>", function() mc.clearCursors() end)
      end)
    end
  }
}
