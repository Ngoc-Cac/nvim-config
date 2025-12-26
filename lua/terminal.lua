-- Functions for toggling terminal
-- keep track of the win and buffer
local term = {buf = nil, win = nil, is_float = false}

local function is_valid_win(win)
    return win and vim.api.nvim_win_is_valid(win)
end

local function is_valid_buf(buf)
    return buf and vim.api.nvim_buf_is_valid(buf) 
end

local function create_split(dim)
  local width = dim and dim.width
    or math.floor(vim.o.columns / 3)

  vim.cmd.vnew()
  vim.cmd.wincmd("L")

  term.win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_width(term.win, width)
  vim.api.nvim_win_set_buf(term.win, term.buf)
  term.is_float = false
end

local function create_float(dim)
  local ui = vim.api.nvim_list_uis()[1]

  local width  = math.floor(ui.width  * 0.8)
  local height = math.floor(ui.height * 0.8)

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
  term.is_float = true
end

function toggle_term(opts)
  opts = opts or {}
  local split = opts.split ~= false -- default: true
  local dim = opts.dim

  -- If window exists, close it (toggle off)
  if is_valid_win(term.win) then
    vim.api.nvim_win_close(term.win, true)
    term.win = nil
    -- do not exit if we are switching between float and split
    if term.is_float ~= split then return end
  end

  -- Create buffer if needed
  if not term.buf or not vim.api.nvim_buf_is_valid(term.buf) then
    term.buf = vim.api.nvim_create_buf(false, true)
    vim.bo[term.buf].bufhidden = "hide"
    vim.api.nvim_buf_call(term.buf, function()
        vim.cmd.term()
    end)
    vim.api.nvim_chan_send(vim.bo[term.buf].channel, "clear\n")
  end

  if split then
    create_split(dim)
  else
    create_float(dim)
  end
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
    "t", "<esc>", "<C-\\><C-n>",
    { desc = "Exit terminal mode." }
)
vim.keymap.set(
    "n", "<LocalLeader>tv", function() toggle_term() end,
    { desc = "Toggle terminal in split view." }
)
vim.keymap.set(
    "n", "<LocalLeader>tf", function() toggle_term({split = false}) end,
    { desc = "Toggle terminal in float window." }
)

