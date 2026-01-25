return {
  "folke/flash.nvim",
  ---@type Flash.Config
  keys = {
    { "f", mode = { "n", "v" } }, { "F", mode = { "n", "v" } },
    { "t", mode = { "n", "v" } }, { "T", mode = { "n", "v" } },

    -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  opts = {},
}
