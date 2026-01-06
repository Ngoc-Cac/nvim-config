vim.api.nvim_create_user_command("BufOnly", function()
    vim.cmd("%bd|e#|b#")
end, {})
