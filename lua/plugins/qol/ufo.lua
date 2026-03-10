local selector_map = {
  python = { "treesitter", "indent" },
}

return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ufo = require("ufo")
    ufo.setup({
      provider_selector = function(_, ft, _)
        return selector_map[ft]
      end
    })

    -- open and close all
    vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds." })
    vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds." })
    -- peek a fold
    vim.keymap.set("n", "zK", function()
        local winid = ufo.peekFoldedLinesUnderCursor()
        if not winid then vim.lsp.buf.hover() end
      end,
      { desc = "Peek into the current fold." }
    )
  end
}
