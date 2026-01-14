-- Functions for toggling terminal
-- keep track of the win and buffer
local utils = require("terminal.utils")
local config = {
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
        width = config.float.width or math.floor(ui.width * config.float.float_ratio)
        height = config.float.height or math.floor(ui.height * config.float.float_ratio)
    else
        width = config.split.width or math.floor(vim.o.columns * config.split.width_ratio)
        height = config.split.height or math.floor(vim.o.columns * config.split.height_ratio)
    end
    return width, height
end

local function toggle_term(split)
    split = split or "right" -- vertical split by default

    -- only returns if not switching view
    if close_win_if_exists() and term.split_kind == split then return end

    -- create buf if no buffer
    if not utils.is_valid_buf(term.buf) then term.buf = utils.create_term_buf() end

    local w, h = get_win_wh(split)
    term.win = utils.create_win(term.buf, { split = split, width = w, height = h })
    term.split_kind = split

    vim.keymap.set(
        { "n", "i", "t" },
        "<esc>q", function()
            vim.cmd.stopinsert()
            toggle_term(term.split_kind)
        end,
        { buffer = term.buf, desc = "Toggle current terminal off" }
    )
end

local function setup(opts)
    opts = opts or {}
    config = vim.tbl_deep_extend("force", config, opts)
end

vim.keymap.set(
    "n", "<LocalLeader>tv", toggle_term,
    { desc = "Toggle terminal in split view." }
)
vim.keymap.set(
    "n", "<LocalLeader>tf", function() toggle_term("float") end,
    { desc = "Toggle terminal in float window." }
)
return { setup = setup, toggle_term = toggle_term }
