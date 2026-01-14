local function is_valid_win(win)
    return win and vim.api.nvim_win_is_valid(win)
end

local function is_valid_buf(buf)
    return buf and vim.api.nvim_buf_is_valid(buf)
end

local function create_term_buf()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].bufhidden = "hide"
    vim.api.nvim_buf_call(buf, vim.cmd.term)
    vim.cmd.startinsert()

    -- automatically close the tab if 'exit' is called 
    vim.api.nvim_create_autocmd("TermClose", {
        buffer = buf,
        once = true,
        callback = function()
            vim.api.nvim_buf_delete(buf, { force = false })
        end,
    })
    return buf
end

return {
    is_valid_win = is_valid_win,
    is_valid_buf = is_valid_buf,
    create_term_buf = create_term_buf
}
