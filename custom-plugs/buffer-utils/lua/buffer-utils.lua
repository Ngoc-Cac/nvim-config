local function buf_del()
    local cur_buf = vim.api.nvim_get_current_buf()
    local cur_win = vim.api.nvim_get_current_win()

    local next_win = nil
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if win ~= cur_win then
            next_win = cur_win
            break
        end
    end

    if next_win then
        vim.api.nvim_set_current_win(next_win)
    else
        local alt_buf = vim.fn.bufnr("#")
        local is_valid = vim.api.nvim_buf_is_loaded(alt_buf)

        if alt_buf == -1 or not is_valid then
            vim.notify(
                "No previous buffer to switch to!",
                vim.log.levels.INFO,
                { title = "No previous buffer!", timeout = 3000 }
            )
            return
        elseif is_valid and alt_buf ~= cur_buf then
            vim.api.nvim_set_current_buf(alt_buf)
        end
    end

    vim.api.nvim_buf_delete(cur_buf, { force = false })
end

vim.keymap.set("n", "<localleader>bd", buf_del, { desc = "Delete the current buffer." })
vim.api.nvim_create_user_command("R", function(opts)
    vim.cmd("e " .. opts.args .. " | bd#")
end, { nargs = 1, complete = "file" })

return { setup = function(_) end, del_cur_buf = buf_del }
