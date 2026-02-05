-- show lsp diagnostic
vim.diagnostic.config({
  severity_sort = true,  -- sort the severity in the statuscol
  virtual_text = false,
  virtual_lines = false,
  signs = { text = { [vim.diagnostic.severity.HINT] = "" } },
  float = {
    source = true,
    header = "Diagnostics:",
    border = "rounded",
    max_width = 80,
    close_events = { "CursorMoved", "BufLeave", "WinLeave", "InsertEnter" },
  },
})

local lsp_capabilities = {
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
    }
  }
}
local lsp_servers = {
  "jsonls", "yamlls", "tombi", "cssls",
  "markdown_oxide", "html",

  "bashls", "lua_ls", "ts_ls",
  "basedpyright", -- NOTE: pyrightconfig.json will override ls conf
}
return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {-- enable when issue
      -- log_level = vim.log.levels.DEBUG,
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    lazy = true, -- we manually load it in nvim-lspconfig
    opts = {
      ensure_installed = lsp_servers,
      automatic_enable = lsp_servers,
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      -- progress report for lsps
      { "j-hui/fidget.nvim", opts = {} }
    },
    config = function()
      for _, server in ipairs(lsp_servers) do
        vim.lsp.config(server, lsp_capabilities)
      end
    end
  }
}
