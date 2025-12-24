local function find_terminal_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
      return buf
    end
  end
  return nil
end

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
        local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

        vim.api.nvim_create_autocmd({ 'User' }, {
            pattern = "SessionSavePre",
            group = config_group,
            callback = function()
                local buf = find_terminal_buf()
                if buf then
                    vim.api.nvim_chan_send(vim.bo[buf].channel, 'exit\r\n')
                end
            end,
        })
    end
}
