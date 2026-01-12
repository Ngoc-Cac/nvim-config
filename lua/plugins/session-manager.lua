local function ft_detect()
    local detect_ft = "filetype detect"
    vim.schedule(function() vim.cmd(detect_ft) end)
end

return {
    "Shatur/neovim-session-manager",
    dependencies = { "nvim-lua/plenary.nvim" },
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

        local group = vim.api.nvim_create_augroup("SessionManagerPost", { clear = true })
        vim.api.nvim_create_autocmd("User", {
            pattern = "SessionLoadPost",
            group = group,
            callback = ft_detect
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
