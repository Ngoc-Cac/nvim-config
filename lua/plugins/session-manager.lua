return {
    "Shatur/neovim-session-manager",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local sess_config = require("session_manager.config")
        require("session_manager").setup({
            autosave_ignore_buftypes = { "terminal" }, -- don't save terminal buffers
            autosave_only_in_session = true,
            autoload_mode = {
                sess_config.AutoloadMode.GitSession,
                sess_config.AutoloadMode.LastSession,
                sess_config.AutoloadMode.Disabled
            }
        })
        vim.keymap.set(
            "n", "<localleader>ss", ":SessionManager load_session<cr>",
            { desc = "Load saved sessions" }
        )
        vim.keymap.set(
            "n", "<localleader>sg", ":SessionManager load_git_session<cr>",
            { desc = "Load saved git sessions" }
        )
        vim.keymap.set(
            "n", "<localleader>sl", ":SessionManager load_last_session<cr>",
            { desc = "Load last saved sessions" }
        )
    end
}
