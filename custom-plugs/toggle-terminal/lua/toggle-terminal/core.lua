-- Functions for toggling terminal
-- keep track of the win and buffer
local utils = require("toggle-terminal.utils")
local M = {}
M.config = {
    split = {
        width_ratio = 0.3,
        height_ratio = 0.3,
        width = nil,
        height = nil
    },
    float = {
        float_ratio = 0.8,
        width = nil,
        height = nil
    },
}
local term = { buf = nil, win = nil, split_kind = "vertical" }

local function close_win_if_exists()
    local is_open = utils.is_valid_win(term.win)
    if is_open then
        vim.api.nvim_win_close(term.win, true)
        term.win = nil
    end
    return is_open
end

local function get_win_wh(split_kind)
    local width = nil
    local height = nil
    if split_kind == "float" then
        local ui = vim.api.nvim_list_uis()[1]
        width = M.config.float.width or math.floor(ui.width * M.config.float.float_ratio)
        height = M.config.float.height or math.floor(ui.height * M.config.float.float_ratio)
    else
        width = M.config.split.width or math.floor(vim.o.columns * M.config.split.width_ratio)
        height = M.config.split.height or math.floor(vim.o.lines * M.config.split.height_ratio)
    end
    return width, height
end

function M.toggle_term(split)
    split = split or "right" -- vertical split by default

    -- only returns if not switching view
    if close_win_if_exists() and term.split_kind == split then return end

    -- create buf if no buffer
    if not utils.is_valid_buf(term.buf) then term.buf = utils.create_term_buf() end

    local w, h = get_win_wh(split)
    term.win = utils.create_win(term.buf, { split = split, width = w, height = h })
    term.split_kind = split

    vim.keymap.set(
        "t", "<esc>q", function()
            vim.cmd.stopinsert()
            M.toggle_term(term.split_kind)
        end,
        { buffer = term.buf, desc = "Toggle current terminal off" }
    )
    vim.keymap.set(
        "n", "q", function() M.toggle_term(term.split_kind) end,
        { buffer = term.buf, desc = "Toggle current terminal off" }
    )
end

return M
