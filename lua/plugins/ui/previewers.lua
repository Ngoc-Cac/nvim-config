return {
  { -- a web-based version, which is nice to test stuff out, but requires npm 
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install && git restore .", -- npm modifies lock for some reason 
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
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
