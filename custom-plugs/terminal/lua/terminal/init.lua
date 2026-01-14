-- Functions for toggling terminal
-- keep track of the win and buffer
local config = { width_ratio = 0.45, float_ratio = 0.85 }
local term = { buf = nil, win = nil, is_float = false }

local function is_valid_win(win)
    return win and vim.api.nvim_win_is_valid(win)
end

local function create_split()
    local width = math.floor(vim.o.columns * config.width_ratio)

    vim.cmd.vnew()
    vim.cmd.wincmd("L")

    term.win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_width(term.win, width)
    vim.api.nvim_win_set_buf(term.win, term.buf)
end

local function create_float()
    local ui = vim.api.nvim_list_uis()[1]

    local width  = math.floor(ui.width  * config.float_ratio)
    local height = math.floor(ui.height * config.float_ratio)

    local row = math.floor((ui.height - height) / 2)
    local col = math.floor((ui.width  - width)  / 2)

    term.win = vim.api.nvim_open_win(term.buf, true, {
        relative = "editor",
        row = row - 2,
        col = col,
        width = width,
        height = height,
        style = "minimal",
        border = "rounded",
    })
end

local function close_win_if_exists()
    local is_open = is_valid_win(term.win)
    if is_open then
        vim.api.nvim_win_close(term.win, true)
        term.win = nil
    end
    return is_open
end

local function create_buf_if_needed()
    local valid_buf = term.buf and vim.api.nvim_buf_is_valid(term.buf)
    if not valid_buf then
        term.buf = vim.api.nvim_create_buf(false, true)
        vim.bo[term.buf].bufhidden = "hide"
        vim.api.nvim_buf_call(term.buf, vim.cmd.term)
    end
    return not valid_buf
end

local function toggle_term(opts)
    opts = opts or {}
    local float = opts.float == true -- create split by default

    -- only returns if not switching view
    if close_win_if_exists() and term.is_float == float then return end

    create_buf_if_needed()

    if float then create_float() else create_split() end
    term.is_float = float
    -- vim.keymap.set(
    --     { "n", "i", "t" },
    --     "<esc>q", function() toggle_term(not term.is_float) end,
    --     { buffer = term.buf, desc = "Toggle terminal off" }
    -- )
end

local function setup(opts)
    opts = opts or {}
    config = vim.tbl_deep_extend("keep", config, opts)
end

-- automatically close the tab if 'exit' is called 
vim.api.nvim_create_autocmd("TermClose", {
    callback = function(args)
        local buf = args.buf
        if buf == term.buf and is_valid_win(term.win) then
            vim.api.nvim_buf_delete(buf, { force = false })
        end
    end,
})

vim.keymap.set(
    "n", "<LocalLeader>tv", function() toggle_term() end,
    { desc = "Toggle terminal in split view." }
)
vim.keymap.set(
    "n", "<LocalLeader>tf", function() toggle_term({float = true}) end,
    { desc = "Toggle terminal in float window." }
)
return { setup = setup, toggle_term = toggle_term }
