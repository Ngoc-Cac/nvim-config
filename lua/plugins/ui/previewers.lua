return {
    -- markdown previewer
    {
        "OXY2DEV/markview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        enabled = false,
        opts = { preview = { enable = false } },
    },
    { -- a web-based version, which is nice to test stuff out, but requires npm 
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install && git restore .", -- npm modifies lock for some reason 
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
    },
    -- color previewer
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        opts = {
            vim = { mode = "foreground" },
            lua = { mode = "foreground" }
        }
    },
}
