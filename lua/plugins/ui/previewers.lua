local md_cmds = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" }
local function register_lazy_cmd()
  for _, cmd in pairs(md_cmds) do
    -- referenced from https://github.com/dopey/nvim/commit/c3e068b847e8ac5bbea425940b0b8de8cd9707a2
    -- issue: https://github.com/iamcco/markdown-preview.nvim/issues/585
    vim.api.nvim_create_user_command(
      cmd,
      function()
        vim.cmd.delcommand(cmd)
        require("lazy").load(
          { plugins = { "markdown-preview.nvim" } }
        )
        -- commands appear only after BufEnter
        vim.api.nvim_exec_autocmds("BufEnter", {})
        vim.cmd(cmd)
      end,
      {}
    )
  end
end

return {
  { -- a web-based version, which is nice to test stuff out, but requires npm 
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install && git restore .", -- npm modifies lock for some reason 
    lazy = true,
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }

      register_lazy_cmd()
    end,
  },
  -- color previewer
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPost",
    opts = {
      filetypes = {
        "*",
        vim = { mode = "foreground" },
        lua = { mode = "foreground" },
        css = { css = true, css_fn = true },
        html = { css = true, css_fn = true },
      },
      user_default_options = { xterm = true }
    }
  },
}
