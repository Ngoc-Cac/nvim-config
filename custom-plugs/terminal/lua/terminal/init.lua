-- Functions for toggling terminal
-- keep track of the win and buffer
local utils = require("terminal.utils")
local config = { width_ratio = 0.45, float_ratio = 0.85 }
local term = {
    buf = nil,
    win = nil,
    split_kind = "vertical",
}

local function close_win_if_exists()
    local is_open = utils.is_valid_win(term.win)
    if is_open then
        vim.api.nvim_win_close(term.win, true)
        term.win = nil
    end
    return is_open
end

local function toggle_term(split_kind)
    split_kind = split_kind or "right" -- vertical split by default

    -- only returns if not switching view
    if close_win_if_exists() and term.split_kind == split_kind then return end

    -- create buf if no buffer
    if not utils.is_valid_buf(term.buf) then term.buf = utils.create_term_buf() end

    local width = nil
    local height = nil
    if split_kind == "float" then
        local ui = vim.api.nvim_list_uis()[1]
        width = math.floor(ui.width * config.float_ratio)
        height = math.floor(ui.height * config.float_ratio)
    else
        width = math.floor(vim.o.columns * config.width_ratio)
    end

    term.win = utils.create_win(term.buf, {
        split = split_kind, width = width, height = height
    })
    term.split_kind = split_kind

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
    config = vim.tbl_deep_extend("keep", config, opts)
end

vim.keymap.set(
    "n", "<LocalLeader>tv", function() toggle_term() end,
    { desc = "Toggle terminal in split view." }
)
vim.keymap.set(
    "n", "<LocalLeader>tf", function() toggle_term("float") end,
    { desc = "Toggle terminal in float window." }
)
return { setup = setup, toggle_term = toggle_term }
