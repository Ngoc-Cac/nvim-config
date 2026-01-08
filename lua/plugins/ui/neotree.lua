return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false, -- neo-tree will lazily load itself
    enabled=false,
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        close_if_last_window = true,
        add_blank_line_at_top = true,
        auto_clean_after_session_restore = true,
        window = {width = 30},
        buffers = {show_unloaded = true},
        filesystem = {
            -- hidden files
            filtered_items = {visible = true}
        }
    },
    keys = {
        {
            "<C-b>", ":Neotree show toggle<cr>",
            mode = { "n", "i" }, desc = "Toggle Neotree."
        }
    }
}
