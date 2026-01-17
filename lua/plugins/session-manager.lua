-- session_manager does not detect the first buffer for some reason
local function redetect_first_buf()
    local detect_ft = "filetype detect"
    local buffers = vim.api.nvim_list_bufs()
    if #buffers > 0 and vim.api.nvim_buf_is_loaded(buffers[1]) then
        vim.api.nvim_buf_call(buffers[1], function() vim.cmd(detect_ft) end)
    end
    vim.cmd(detect_ft)
end

local function config()
    local sess_config = require("session_manager.config")
    require("session_manager").setup({
        autosave_ignore_buftypes = { "terminal", "netrw" }, -- don't save terminal buffers
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
        callback = function() vim.schedule(redetect_first_buf) end
    })
end

return {
    "Shatur/neovim-session-manager",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    keys = {
        {
            "<localleader>ss", ":SessionManager load_session<cr>",
            desc = "Load saved sessions"
        },
        {
            "<localleader>sg", ":SessionManager load_git_session<cr>",
            desc = "Load saved git sessions"
        },
        {
            "<localleader>sl", ":SessionManager load_last_session<cr>",
            desc = "Load last saved sessions"
        }
    },
    config = config
}
