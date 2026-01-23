return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    cmd = "Oil",
    keys = {
        { "-", ":Oil<cr>", desc = "Open Oil" },
        { "<leader>ol", ":topleft 30vsplit | Oil .<cr>", desc = "Open Oil to the left" },
        { "<leader>ot", ":tab Oil<cr>", desc = "Open Oil in new tab" },
        { "<leader>of", ":Oil --float .<cr>", desc = "Open Oil in float window"}
    },
    ---@module "oil"
    ---@type oil.SetupOpts
    opts = {
        buf_options = { bufhidden = "delete" },
        skip_confirm_for_simple_edits = true, -- no del, at most one cp/mv and five adds
        view_options = { show_hidden = true },
        float = {
            border = "rounded",
            override = function(defaults)
                defaults["title"] = ""
                defaults["title_pos"] = "center"
                return defaults
            end
        },
        confirmation = { border = "rounded" }
    },
}
