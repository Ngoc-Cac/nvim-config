return {
    "Shatur/neovim-session-manager",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local sess_config = require("session_manager.config")
        require("session_manager").setup({
            autosave_only_in_session = true,
            autoload_mode = {
                sess_config.AutoloadMode.GitSession,
                sess_config.AutoloadMode.LastSession,
                sess_config.AutoloadMode.Disabled
            }
        })
    end
}
