return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufReadPost",
  opts = {
    provider_selector = function() return { "lsp", "indent" } end
  },
  config = function(opts)
    local ufo = require("ufo")
    ufo.setup(opts)

    -- open and close all
    vim.keymap.set(
      "n", "zR", ufo.openAllFolds, { desc = "Open all folds." }
    )
    vim.keymap.set(
      "n", "zM", ufo.closeAllFolds, { desc = "Close all folds." }
    )
    -- peek a fold
    vim.keymap.set(
      "n", "zK",
      function()
        local winid = ufo.peekFoldedLinesUnderCursor()
        if not winid then vim.lsp.buf.hover() end
      end,
      { desc = "Peek into the current fold." }
    )
  end
}
