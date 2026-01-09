-- for some reason, treesitter parses vim.cmd("whatever")
-- as ERROR, so doing this as alternative 
local tab_cmd = "tabn"
local buf_cmd = "bn"

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
        local is_valid = vim.api.nvim_buf_is_valid(alt_buf)

        if alt_buf == -1 then
            vim.cmd(tab_cmd)  -- see above for why
        elseif is_valid and alt_buf ~= cur_buf then
            vim.api.nvim_set_current_buf(alt_buf)
        else
            vim.cmd(buf_cmd)
        end
    end

    vim.api.nvim_buf_delete(cur_buf, { force = false })
end

vim.keymap.set("n", "<localleader>bd", buf_del, { desc = "Delete the current buffer."})
vim.keymap.set(
    "n", "<localleader>bb", ":%bd|e#|b#",
    { desc = "Delete all buffers except the current one."}
)
vim.api.nvim_create_user_command("R", function(opts)
    vim.cmd("e " .. opts.args .. " | bd#")
end, { nargs = 1, complete = "file" })
